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
library(dply)
library(plyr)
library(ggplot2)
consumer_key<-'TYlxAKgVIQDEXUx2YpO85huoB'
consumer_secret<-'65bfZgRzU0xk1X5tbD0SsSRZVzhQ7p75kyqrjmpReXNNzyJ20V'
access_token<-'777582623703068673-r3xuSNr9qyOfQtXr7iHj0touChSMIME'
access_secret<-'ldwUn37rX0n9ilrWL8VCePgDB1gGkcpsfushzZiEnQReg'
setup_twitter_oauth(consumer_key,consumer_secret,access_token,
                    access_secret)
twet11<-searchTwitter("karnataka water",n=1000, geocode ='12.9716,77.5946, 100mi',
since = "2016-9-1",lang = "en")
twet11.df<- ldply(twet11, function(t) t$toDataFrame())
write.csv(twet11.df, "water.csv")
# geting the text
twet_text=sapply(twet11, function(x) x$getText())
#remove re tweet
twet_text = gsub("(RT|via)((?:\\b\\W+)+)", "",twet_text)
# remove people
twet_text= gsub("@\\w+","",twet_text)
# remove punc.
twet_text=gsub("[[:punct:]]","",twet_text)
# removing digits
twet_text=gsub("[[:digit:]]","",twet_text)
# removing links
twet_text=gsub("https\\w+","",twet_text)
#removing spaces 
twet_text=gsub("[\t]{2,}","",twet_text)
twet_text=gsub("^\\s+\\s+$","",twet_text)
write.csv(twet_text, "water1.csv")


