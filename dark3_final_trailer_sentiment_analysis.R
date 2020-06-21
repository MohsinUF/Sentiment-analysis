# sentiment analysis of "Dark 3 - final trailer"
# one of the popular TV series of Netfilx
# the comments from the trailer on YouTube were analyzed to see the sentiments of the viewers
# by: Mohsin Uddin

library(tuber)
library(syuzhet)
library(ggplot2)

# setting up the connection to YouTube
app_id = "xxxxxxxxxxxxxxxxxxxx"
app_secret = "xxxxxxxxxxxxxxxxx"
yt_oauth(app_id, app_secret)

# getting data from youtube 
dark = get_comment_threads(filter = c(video_id = "cq2iTHoLrt0"))

# cleaning data
d3 = iconv(dark$textDisplay)

# sentiment analysis
s = get_nrc_sentiment(d3)
head(s)

# plotting result
barplot(colSums(s),
        las = 2,
        col = rainbow(10),
        ylab = "count",
        main = "Dark 3 final trailer sentiment analysis",
        cex.names = 0.75)
