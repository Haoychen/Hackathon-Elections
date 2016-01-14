twitter.data <- read.csv('Twitter_export.csv')
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