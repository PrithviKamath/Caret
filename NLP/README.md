# NLP with TM package for French document
<br />
Two short stories,'Goldilocks and the three bears' and 'The three little pigs' are placed in the texts folder in the same directory as the R document. <br />
<br />
NLP is performed in the following steps: <br />
<br />
<b>Step 1</b>: Import required libraries <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm1.png'></img> <br />
<b>Step 2</b>: Assign the right path to the ‘text’ folder <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm2.png'></img> <br />
<b>Step 3</b>: Load documents <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm3.png'></img> <br />
<b>Step 4</b>: Check the document and get the original character count <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm4.png'></img> <br />
<b>Step 5</b>: Remove punctuations and get the character count <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm5.png'></img> <br />
<b>Step 6</b>: Remove special character and get the character count <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm6.png'></img> <br />
<b>Step 7</b>: Remove numbers and get the character count <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm7.png'></img> <br />
<b>Step 8</b>: Convert to lowercase, remove stopwords and get character count <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm8.png'></img> <br />
<b>Step 9</b>: Stem the words and Strip unnecessary white spaces and convert the document to plain text <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm9.png'></img> <br />
<b>Step 10</b>: Create document term matrix and export it to an excel spreadsheet <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm10.png'></img> <br />
<b>Step 11</b>: Create a transpose of the dtm to get a term document matrix and export it to an excel spreadsheet <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm11.png'></img> <br />
<b>Step 12</b>: Remove sparse words <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm12.png'></img> <br />
<b>Steps 13</b>: Get the word frequencies and plot a graph to display the top 10 words with highest frequencies <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm13.png'></img> <br />
<b>Step 14</b>: Plot a bar graph to display words with frequency > 10 <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm14.png'></img> <br />
<b>Step 15</b>: Create a wordcloud <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm15.png'></img> <br />
<b>Step 16</b>: Create a cluster dendrogram <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm16.png'></img> <br />
<b>Step 17</b>: KMeans clustering <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/tm17.png'></img> <br />
<br />
<br />
<h1>NLP with UDPIPE package for Hindi document</h1> <br />
<br />
'VikramAndBetal_HindiDocument.txt' is placed in the same folder as that of the R document. <br />
<br />
NLP is performed in the following steps: <br />
<br />
<b>Step 1</b>: Import required R packages <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe1.png'></img> <br />
<b>Step 2</b>: Loading Hindi language model using udpipe <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe2.png'></img> <br />
<b>Step 3</b>: Load documents <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe3.png'></img> <br />
<b>Analysis 1</b>: Find the frequency of each words and display the words with largest frequency <br />
•	Read the file using: <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe4.png'></img> <br />
•	Split the words using: <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe5.png'></img> <br />
•	Find the frequency of each word using: <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe6.png'></img> <br />
•	Sort the words in descending order of frequency and display the top 7 <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe7.png'></img> <br />
<b>Analysis 2</b>: Calculate the parts of speech <br />
•	Find the frequency of parts of speech and display it using a bar plot <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe8.png'></img> <br />
<b>Analysis 3</b>: Find the most occurring nouns <br />
•	Find the frequency of the nouns and display it using a bar plot <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe9.png'></img> <br />
<b>Analysis 4</b>: Find the most occurring adjectives <br />
•	Find the frequency of the adjectives and display using a bar plot <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe10.png'></img> <br />
<b>Analysis 5</b>: Display the most frequently occurring words with frequency greater than 3 in a WordCloud <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe11.png'></img> <br />
<b>Analysis 6</b>: Find cooccurrences within a 3 word limit <br />
<img src='https://github.com/PrithviKamath/R-Programing/blob/master/NLP/Images/udpipe12.png'></img> <br />
