install.packages("twitteR")
install.packages("ROAuth")
install.packages("stringr")
install.packages("wordcloud")
install.packages("sentiment")
install.packages("Rstem")
install.packages("C:/Users/Rahul Suan/Desktop/sentiment_0.1.tar.gz", repos = NULL, type="source")
install.packages("tm")
install.packages("RCurl")
install.packages("SnowballC")
install.packages("httr")
setwd("C:/Users/Rahul Suan/Desktop/R")
library(ROAuth)
library(twitteR)
library(stringr)
library(wordcloud)
library(sentiment)
library(Rstem)
library(sentiment)
library(tm)
library(RCurl)
library(gdata)
library(SnowballC)
library(httr)
library(ggplot2)
mydata<-read.csv("water1.csv", sep = ",", header = TRUE)
mycorpus<-Corpus(VectorSource(mydata$x))
mycorpus<-tm_map(mycorpus, PlainTextDocument)
mycorpus<-tm_map(mycorpus, removePunctuation)
mycorpus<-tm_map(mycorpus, removeWords, stopwords (kind = "en"))
mycorpus<-tm_map(mycorpus,stemDocument)
pal<- brewer.pal(8,"Dark2")
wordcloud(mycorpus,min.freq = 30 , max.words = Inf, width=1000, 
          height=1000, random.order = FALSE, color=pal)
#######################
# getting the emotions#
#######################


class_emo<-classify_emotion(mydata, algorithm= "bayes", prior=1.0)
emotion=class_emo[,7]
#emotion=is.na(emotion)="unknown"
class_pol = classify_polarity(mydata, algorithm = "bayes")

polarity = class_pol[,4]
sent_df = data.frame(text=mydata, emotion=emotion, 
                     polarity=polarity, stringsAsFactors = FALSE)

sent_df = within(sent_df, emotion<-factor(emotion, 
            levels = names(sort(table(emotion),decreasing = TRUE))))


##########ploting the reasults###################

ggplot(sent_df,
       aes(x=emotion))+geom_bar(aes(y=..count.., fill=emotion))













