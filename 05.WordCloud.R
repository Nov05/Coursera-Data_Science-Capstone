
# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# generate word frequence table
# refer to 04.week2_task1_text cleanse.R
df <- readRDS(file = "D:/R/capstone/data/word_freq_twitter_en.rds")

quantile(df$freq)

# plotting
df2 <- df[1:500,]
plot(df2$freq,
     main='Word Frequence',
     ylab="Frequence",
     xlab="Word")

library(ggplot2)
par(mfrow=c(2,2))
df2 <- df[1:200,]
ggplot(data=df2, aes(x=df2$freq)) + 
geom_histogram(colour="black", fill="white") + 
labs(title="Histogram for Top 200 Word Frequence", x="Word Frequency", y="Count")

# generate word cloud
set.seed(1234)
wordcloud(words = df$word, freq = df$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
