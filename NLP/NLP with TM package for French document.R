#Loading required packages
Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")
install.packages(Needed, dependencies=TRUE)

#Assign right path
cname <- file.path(".", "texts")   
cname   
dir(cname) 

# Load the R package for text mining and then load your texts into R.
library(tm)   
docs <- Corpus(DirSource(cname))   
summary(docs) 

#See the entire document in R console
inspect(docs)

#original character count in doc[1]: 3861
#original character count in doc[2]: 5656
nchar(docs[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(docs[2], type = "chars", allowNA = FALSE, keepNA = NA)

# Removing punctuation:
data <- tm_map(docs, removePunctuation)

#character count in doc[1] after removing punctuations: 3616
#character count in doc[2] after removing punctuations: 5413
nchar(data[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(data[2], type = "chars", allowNA = FALSE, keepNA = NA)

#Remove special characters.
for(j in seq(data))   
{   
  data[[j]] <- gsub("/", " ", data[[j]])   
  data[[j]] <- gsub("@", " ", data[[j]])   
  data[[j]] <- gsub("\\|", " ", data[[j]])   
} 

#character count in doc[1] after removing special characters: 3616
#character count in doc[2] after removing special characters: 5413
nchar(data[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(data[2], type = "chars", allowNA = FALSE, keepNA = NA)

# Removing numbers:
data <- tm_map(data, removeNumbers) 

#character count in doc[1] after removing numbers: 3616
#character count in doc[2] after removing numbers: 5413
nchar(data[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(data[2], type = "chars", allowNA = FALSE, keepNA = NA)

# Converting to lowercase:
data <- tm_map(data, tolower)

# Removing "stopwords" (common words) that usually have no analytic value.
data <- tm_map(data, removeWords, stopwords("french"))   

#character count in doc[1] after removing stopwords: 2913
#character count in doc[2] after removing stopwords: 4461
nchar(data[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(data[2], type = "chars", allowNA = FALSE, keepNA = NA)

library(SnowballC)   
dataw <- tm_map(data, stemDocument, language = "fr")

# Stripping unnecesary whitespace from your documents:
data <- tm_map(data, stripWhitespace)

#character count in doc[1] after stemming and removing white spaces: 2656
#character count in doc[2] after stemming and removing white spaces: 4061
nchar(data[1], type = "chars", allowNA = FALSE, keepNA = NA)
nchar(data[2], type = "chars", allowNA = FALSE, keepNA = NA)

#Converting the document to plain text
data <- tm_map(data, PlainTextDocument)   

# create a document term matrix.
dtm <- DocumentTermMatrix(data)   
dtm

#Display the number of term in every document
dim(dtm)

##Export the matrix to Excel:   
m <- as.matrix(dtm)   
dim(m)   
write.csv(m, file="dtm.csv") 

#Create a transpose of this matrix
tdm <- TermDocumentMatrix(data)   
tdm   

##Export the matrix to Excel: 
mt <- as.matrix(tdm)   
dim(mt) 
write.csv(mt, file="tdm.csv") 

## Organize terms by their frequency:
freq <- colSums(as.matrix(dtm))   
length(freq)  
ord <- order(freq)

#remove sparse terms:   
dtms <- removeSparseTerms(dtm, 0.1) # This makes a matrix that is 10% empty space, maximum.   
inspect(dtms)

## Word Frequency
freq[head(ord)] 
freq[tail(ord)] 

## Check out the frequency of frequencies.
head(table(freq), 20)
tail(table(freq), 20) 

#Display top 10 words with highest frequencies
freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)   
head(freq, 10)   

#Alternate method to display frequency:
wf <- data.frame(word=names(freq), freq=freq)   
head(wf)  

## Plot Word Frequencies

## Plot words that appears more than 10 times.
library(ggplot2)   
p <- ggplot(subset(wf, freq>10), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))   
p 

# Word Clouds!
library(wordcloud)   

#plot words occurring at least 250 times.
set.seed(142)   
wordcloud(names(freq), freq, min.freq=250, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))   

##Plot the 100 most frequently occurring words.
set.seed(142)   
dark2 <- brewer.pal(6, "Dark2")   
wordcloud(names(freq), freq, max.words=100, rot.per=0.2, colors=dark2) 

# Clustering by Term Similarity
dtmss <- removeSparseTerms(dtm, 0.15) # This makes a matrix that is only 15% empty space, maximum.   
inspect(dtmss) 

## Hierarchal Clustering
## First calculate distance between words beginning with "a..." & then cluster them according to similarity.
library(cluster)   
d <- dist(t(dtmss[,1:10]), method="euclidian")   
fit <- hclust(d=d, method="ward")   
fit 
plot(fit, hang=-1)  
## Click on the zoom button on the plot..

##Read a Dendrogram
plot.new()
plot(fit, hang=-1)
groups <- cutree(fit, k=5)   # "k=" defines the number of clusters you are using   
rect.hclust(fit, k=5, border="red") # draw dendogram with red borders around the 5 clusters

##K-means clustering
library(fpc)   
d <- dist(t(dtmss), method="euclidian")   
kfit <- kmeans(d, 2)   
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)   

