#Installing required packages
Needed <- c("tm","udpipe","igraph","ggraph","lattice","wordcloud")
install.packages(Needed, dependencies=TRUE)

#Loading the hindi language model using udpipe
library(udpipe)
model<- udpipe_download_model(language = "hindi")
udmodel_hindi<-udpipe_load_model(file = 'hindi-ud-2.0-170801.udpipe')

#reading the hindi encoded text file
hindi <- readLines(con <- file("VikramAndBetal_HindiDocument.txt", encoding = "UTF-8")) 
close(con)
unique(Encoding(hindi))

x<-udpipe_annotate(udmodel_hindi, hindi)
x<-data.frame(x)

####**Analysis 1**
#Calculate the frequency of the words
sentences<-scan("VikramAndBetal.txt","character",sep="\n",encoding='UTF-8');

#Split sentence
words<-strsplit(sentences," ")

#Calculate word frequencies
freq=words.freq<-table(unlist(words))
#Display the frequency along with each word
cbind(names(words.freq),as.integer(words.freq))

#Sorting indescending order according to frequency and displayinig only top 7
head(freq[order(nchar(freq), freq, decreasing = TRUE)])

##**Analysis 2**
#Calculate the frequency of the parts of speech in the document
#tokenizing the words in the sentences
print(x$token)

#analyzing the parts of speech of those words
x$lemma

library(lattice)
stats <- txt_freq(x$upos)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = stats, col = "yellow",
        main = "UPOS (Universal Parts of Speech)\n frequency of occurrence", 
         xlab = "Freq")

##**Analysis 3**
#Most occurring Nouns
stats <- subset(x, upos %in% "NOUN")
stats <- txt_freq(x = stats$lemma)

library(lattice)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 30), col = "cadetblue", main = "Most occurring nouns", xlab = "Freq")

##**Analysis 4**
#Most occurring Adjectives
stats <- subset(x, upos %in% c("ADJ")) 
stats <- txt_freq(stats$token)

stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "purple", 
         main = "Most occurring adjectives", xlab = "Freq")

##**Analysis 5**
# Creat a word cloud to display the most frequently occuring words
library(wordcloud)
set.seed(142)   
wordcloud(names(freq), freq, min.freq=3, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))   


##**Analysis 6** 
## Collocation (words following one another)
stats <- keywords_collocation(x = x, 
                              term = "token", group = c("doc_id", "paragraph_id", "sentence_id"),
                              ngram_max = 4)
## Co-occurrences: How frequent do words occur in the same sentence, in this case only nouns or adjectives
stats <- cooccurrence(x = subset(x, upos %in% c("NOUN", "ADJ")), 
                      term = "lemma", group = c("doc_id", "paragraph_id", "sentence_id"))
## Co-occurrences: How frequent do words follow one another
stats <- cooccurrence(x = x$lemma, 
                      relevant = x$upos %in% c("NOUN", "ADJ"))
## Co-occurrences: How frequent do words follow one another even if we would skip 2 words in between
stats <- cooccurrence(x = x$lemma, 
                      relevant = x$upos %in% c("NOUN", "ADJ"), skipgram = 2)

library(igraph)
library(ggraph)
library(ggplot2)
wordnetwork <- head(stats, 30)
wordnetwork <- graph_from_data_frame(wordnetwork)
ggraph(wordnetwork, layout = "fr") +
  geom_edge_link(aes(width = cooc, edge_alpha = cooc), edge_colour = "yellow") +
  geom_node_text(aes(label = name), col = "darkgreen", size=4) +
  theme_graph(base_family = "Arial Naro") +
  theme(legend.position = "none") +
  labs(title = "Cooccurrences within 3 words distance", subtitle = "Nouns & Adjective")
