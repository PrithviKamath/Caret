# NLP with TM package for French document
<br />
Two short stories,'Goldilocks and the three bears' and 'The three little pigs' are placed in the texts folder in the same directory as the R document. <br />
<br />
NLP is performed in the following steps: <br />
Step 1: Import required libraries <br />

Step 2: Assign the right path to the ‘text’ folder <br />

Step 3: Load documents <br />

Step 4: Check the document and get the original character count <br />

Step 5: Remove punctuations and get the character count <br />

Step 6: Remove special character and get the character count <br />

Step 7: Remove numbers and get the character count <br />

Step 8: Convert to lowercase, remove stopwords and get character count <br />

Step 9: Stem the words and Strip unnecessary white spaces and convert the document to plain text <br />

Step 10: Create document term matrix and export it to an excel spreadsheet <br />

Step 11: Create a transpose of the dtm to get a term document matrix and export it to an excel spreadsheet <br />

Step 12: Remove sparse words <br />

Steps 13: Get the word frequencies and plot a graph to display the top 10 words with highest frequencies <br />

Step 14: Plot a bar graph to display words with frequency > 10 <br />

Step 15: Create a wordcloud <br />

Step 16: Create a cluster dendrogram <br />

Step 17: KMeans clustering <br />

<br />
<br />
# NLP with UDPIPE package for Hindi document
<br />
'VikramAndBetal_HindiDocument.txt' is placed in the same folder as that of the R document. <br />

NLP is performed in the following steps: <br />
Step 1: Import required R packages <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm1.png'></img> <br />
Step 2: Loading Hindi language model using udpipe <br />

Step 3: Load documents <br />

Analysis 1: Find the frequency of each words and display the words with largest frequency <br />
•	Read the file using: <br />

•	Split the words using: <br />

•	Find the frequency of each word using: <br />

•	Sort the words in descending order of frequency and display the top 7 <br />

Analysis 2: Calculate the parts of speech <br />
•	Find the frequency of parts of speech and display it using a bar plot <br />

Analysis 3: Find the most occurring nouns <br />
•	Find the frequency of the nouns and display it using a bar plot <br />

Analysis 4: Find the most occurring adjectives <br />
•	Find the frequency of the adjectives and display using a bar plot <br />

Analysis 5: Display the most frequently occurring words with frequency greater than 3 in a WordCloud <br />

Analysis 6: Find cooccurrences within a 3 word limit <br />
