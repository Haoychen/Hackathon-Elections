twitter.data <- read.csv('Twitter_export.csv')
twitter.data$Date <- as.Date(twitter.data$Date, '%Y-%m-%d')
library(twitteR)
library(plyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
tweets <- paste(twitter.data$Title)

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
    require(plyr)
    require(stringr)
    
    # we got a vector of sentences. plyr will handle a list or a vector as an "l" for us
    # we want a simple array of scores back, so we use "l" + "a" + "ply" = laply:
    scores = laply(sentences, function(sentence, pos.words, neg.words) {
        
        # clean up sentences with R's regex-driven global substitute, gsub():
        sentence = gsub('[[:punct:]]', '', sentence)
        sentence = gsub('[[:cntrl:]]', '', sentence)
        sentence = gsub('\\d+', '', sentence)
        # and convert to lower case:
        sentence = tolower(sentence)
        
        # split into words. str_split is in the stringr package
        word.list = str_split(sentence, '\\s+')
        # sometimes a list() is one level of hierarchy too much
        words = unlist(word.list)
        
        # compare our words to the dictionaries of positive & negative terms
        
        neg.matches = match(words, neg.words)
        pos.matches = match(words, pos.words)
        
        # match() returns the position of the matched term or NA
        # we just want a TRUE/FALSE:
        pos.matches = !is.na(pos.matches)
        neg.matches = !is.na(neg.matches)
        
        # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
        score = sum(pos.matches) - sum(neg.matches)
        
        return(score)
    }, pos.words, neg.words, .progress=.progress )
    
    scores.df = data.frame(score=scores, text=sentences)
    return(scores.df)
}

pos <- scan('~/Project/Hackathon-Elections/positive-words.txt', 
            what = 'character', comment.char = ';')
neg <- scan('~/Project/Hackathon-Elections/negative-words.txt', 
            what = 'character', comment.char = ';')

scores <- score.sentiment(tweets, pos, neg, .progress='text')
twitter.data <- cbind(twitter.data, score = scores$score)



Trump_name <- 'realDonaldTrump'
Trump.data <- twitter.data[grepl(Trump_name, twitter.data$Url),]
Hillary_name <- 'HillaryClinton'
Hillary.data <- twitter.data[grepl(Hillary_name, twitter.data$Url),]
Lincoln_name <- 'LincolnChafee'
Lincold.data <- twitter.data[grepl(Lincoln_name, twitter.data$Url),]
Martin_name <- 'MartinOMalley'
Martin.data <- twitter.data[grepl(Martin_name, twitter.data$Url),]
Jim_name <- 'JimWebbUSA'
Jim.data <- twitter.data[grepl(Jim_name, twitter.data$Url),]
John_name <- 'JohnKasich'
John.data <- twitter.data[grepl(John_name, twitter.data$Url),]
Bobby_name <- 'BobbyJindal'
Bobby.data <- twitter.data[grepl(Bobby_name, twitter.data$Url),]
Cruz_name <- 'tedcruz'
Cruz.data <- twitter.data[grepl(Cruz_name, twitter.data$Url),]
Sanders_name <- 'BernieSanders'
Sanders.data <- twitter.data[grepl(Sanders_name, twitter.data$Url),]
Bush_name <- 'JebBush'
Bush.data <- twitter.data[grepl(Bush_name, twitter.data$Url),]
Paul_name <- 'RandPaul'
Paul.data <- twitter.data[grepl(Paul_name, twitter.data$Url),]
Rick_name <- 'RickSantorum'
Rick.data <- twitter.data[grepl(Rick_name, twitter.data$Url),]
Chris_name <- 'ChrisChristie'
Chris.data <- twitter.data[grepl(Chris_name, twitter.data$Url),]
Perry_name <- 'GovernorPerry'
Perry.data <- twitter.data[grepl(Perry_name, twitter.data$Url),]
Pataki_name <- 'GovernorPataki'
Pataki.data <- twitter.data[grepl(Pataki_name, twitter.data$Url),]
Rubio_name <- 'marcorubio'
Rubio.data <- twitter.data[grepl(Rubio_name, twitter.data$Url),]
Santorum_name <- 'TeamSantorum'
Santorum.data <- twitter.data[grepl(Santorum_name, twitter.data$Url),]
Hillary_text <- paste(Hillary.data$Title, collapse = ' ')
Hillary.text <- data.frame(Text = Hillary_text, Name = 'Hillary')
Trump_text <- paste(Trump.data$Title, collapse = ' ')
Trump.text <- data.frame(Text = Trump_text, Name = 'Trump')
Bobby_text <- paste(Bobby.data$Title, collapse = ' ')
Bobby.text <- data.frame(Text = Bobby_text, Name = 'Bobby')
Bush_text <- paste(Bush.data$Title, collapse = ' ')
Bush.text <- data.frame(Text = Bush_text, Name = 'Bush')
Chris_text <- paste(Chris.data$Title, collapse = ' ')
Chris.text <- data.frame(Text = Chris_text, Name = 'Chris')
Cruz_text <- paste(Cruz.data$Title, collapse = ' ')
Cruz.text <- data.frame(Text = Cruz_text, Name = 'Cruz')
Jim_text <- paste(Jim.data$Title, collapse = ' ')
Jim.text <- data.frame(Text = Jim_text, Name = 'Jim')
John_text <- paste(John.data$Title, collapse = ' ')
John.text <- data.frame(Text = John_text, Name = 'John')
Lincold_text <- paste(Lincold.data$Title, collapse = ' ')
Lincold.text <- data.frame(Text = Lincold_text, Name = 'Lincold')
Martin_text <- paste(Martin.data$Title, collapse = ' ')
Martin.text <- data.frame(Text = Martin_text, Name = 'Martin')
Pataki_text <- paste(Pataki.data$Title, collapse = ' ')
Pataki.text <- data.frame(Text = Pataki_text, Name = 'Pataki')
Paul_text <- paste(Paul.data$Title, collapse = ' ')
Paul.text <- data.frame(Text = Paul_text, Name = 'Paul')
Perry_text <- paste(Perry.data$Title, collapse = ' ')
Perry.text <- data.frame(Text = Perry_text, Name = 'Perry')
Rick_text <- paste(Rick.data$Title, collapse = ' ')
Rick.text <- data.frame(Text = Rick_text, Name = 'Rick')
Rubio_text <- paste(Rubio.data$Title, collapse = ' ')
Rubio.text <- data.frame(Text = Rubio_text, Name = 'Rubio')
Sanders_text <- paste(Sanders.data$Title, collapse = ' ')
Sanders.text <- data.frame(Text = Sanders_text, Name = 'Sanders')
Santorum_text <- paste(Santorum.data$Title, collapse = ' ')
Santorum.text <- data.frame(Text = Santorum_text, Name = 'Santorum')
text.data <- rbind(Bobby.text, Bush.text, Chris.text, Cruz.text, Hillary.text, Jim.text, John.text, 
                   Lincold.text, Martin.text, Pataki.text, Paul.text, Perry.text, Rick.text, Rubio.text,
                   Sanders.text, Santorum.text, Trump.text)


emotion_proportion <- function(data) {
    dates <- unique(data$Date)
    pos_percentage <- c()
    neg_percentage <- c()
    neutral_percentage <- c()
    i = 1
    for (date in dates) {
        pos = 0
        neg = 0
        neutral = 0
        for (score in data[data$Date == date,]$score) {
            if (score > 0) {
                pos <- pos + 1
            } else if (score < 0) {
                neg <- neg + 1
            } else {
                neutral <- neutral + 1
            }
        }
        total <- pos + neg + neutral
        pos_percentage[i] <- pos / total
        neg_percentage[i] <- neg / total
        neutral_percentage[i] <- neutral / total
        i <- i + 1
    }
    for (list in list(pos_percentage, neg_percentage, neutral_percentage)) {
        for(j in c(1:length(list))){
            if (j == 1) {
                list[j] <- list[j]
            } else if ( j == length(list) ) {
                list[j] <- list[j]
            } else {
                list[j] <- 0.25 * list[j - 1] + 0.5 * list[j] + 0.25 * list[j + 1]
            }
        }
    }
    result <- data.frame(Date = dates, Pos = pos_percentage, Neg = neg_percentage, Neutral = neutral_percentage)
    return(result)
}
