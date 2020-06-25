# sentiment analysis of the comment thread of the final trailer of Black Widow movie on YouTube 
# by: Mohsin Uddin

library(tuber)
library(syuzhet)
library(ggplot2)

app_id = "xxxxxxxxxxxxxxxxxxxx"
app_secret = "xxxxxxxxxxxxxxxxx"
yt_oauth(app_id, app_secret)


# getting data from youtube 
blackwidow = get_comment_threads(filter = c(video_id = "ybji16u608U"))

# cleaning data
bw = iconv(blackwidow$textDisplay)

# sentiment analysis
s = get_nrc_sentiment(bw)
head(s)

# plotting result
barplot(colSums(s),
        las = 2,
        col = rainbow(10),
        ylab = "count",
        main = "black widow final trailer sentiment analysis")
