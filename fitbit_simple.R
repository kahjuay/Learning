library(lubridate)
library(plyr)
library(dplyr)
library(fitbitScraper)

hr_data = list(time = c(), hrate = c())

cookie = login("kahjuay@gmail.com", "jiarui12", rememberMe = TRUE)
startdate = as.Date('2015-08-19', format = "%Y-%m-%d")
enddate = today()
s = seq(startdate, enddate, by="days")

for (i in 1:length(s)) {
    df = get_intraday_data(cookie, "heart-rate", date=sprintf("%s",s[i]))
    names(df) = c("time","hrate")
    hr_data = rbind(hr_data, df)
    rm(df)}