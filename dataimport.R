# Introduction and Flat Files
# List the files in your working directory
dir()

# Import swimming_pools.csv: pools
pools <- read.csv("swimming_pools.csv")

pools2 <- read.table("swimming_pools.csv",sep=",",header=TRUE)

# Print the structure of pools
str(pools)

# Import hotdogs.txt: hotdogs
hotdogs <- read.delim("hotdogs.txt",header=FALSE)

# Name the columns of hotdogs appropriately
names(hotdogs) <- c("type","calories","sodium")

# Summarize hotdogs
summary(hotdogs)

# Create a path to the hotdogs.txt file: path
path <- file.path("hotdogs","hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path,sep="\t",header=FALSE, col.names=c("type","calories","sodium"))


# Call head() on hotdogs
head(hotdogs)

# Import swimming_pools.csv correctly: pools
pools <- read.csv("swimming_pools.csv",stringsAsFactors=FALSE)

# Check the structure of pools
str(pools)

# Import swimming_pools.csv with factors: pools_factor
pools_factor <- read.csv("swimming_pools.csv")

# Check the structure of pools_factor
str(pools_factor)

# Load in the hotdogs data set: hotdogs
hotdogs <- read.delim("hotdogs.txt", col.names = c("type", "calories", "sodium"),header=FALSE)

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calorie),]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium),]

# Print lily and tom
print(lily)
print(tom)


# Previous call to import hotdogs.txt
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

# Print a vector representing the classes of the columns
print(sapply(hotdogs,class))

# Edit the colClasses argument to import the data correctly: hotdogs2
#hotdogs2 <- read.delim("hotdogs.txt", header = FALSE, 
#                       col.names = c("type", "calories", "sodium"),
#                       colClasses = NA)

# Note quotes for NULL!
hotdogs2 <- read.delim("hotdogs.txt", header = FALSE,  
                        col.names = c("type", "calories", "sodium"), 
                        colClasses = c("factor","NULL","numeric"))
						
# Display the structure of hotdogs2
str(hotdogs2)

# Load the readr package
library(readr)

# Import potatoes.txt using read_delim(): potatoes
potatoes <- read_delim("potatoes.txt", delim="\t")

# Create a subset of potatoes: potatoes_sel
 potatoes_sel <- data.frame(potatoes[,c(6:8)])
 
 
# readr is already loaded

# Column names
properties <- c("area", "temp", "size", "storage", "method", 
                "texture", "flavor", "moistness")

# Import potatoes.csv with read_csv(): potatoes
potatoes <- read_csv("potatoes.csv", col_names<-properties)

# Create a copy of potatoes: potatoes2
potatoes2 <- potatoes

# Convert the method column of potatoes2 to a factor
potatoes2$method <- as.factor(potatoes2$method)



# Column names
properties <- c("area", "temp", "size", "storage", "method", 
                "texture", "flavor", "moistness")

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv("potatoes.txt",skip=7, n_max=5, col_names <- properties)

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv("potatoes.txt",col_types="cccccccc")

# Display the structure of potatoes_char
str(potatoes_char)


# Import without col_types
hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt", 
                           col_names = c("type", "calories", "sodium"),
                           # Change col_types to the correct vector of collectors
                           col_types = list(fac,int,int))

# Display the summary of hotdogs_factor
summary(hotdogs_factor)


# load the data.table package
library(data.table)

# Import potatoes.txt with fread(): potatoes
potatoes <- fread("potatoes.txt")


# Print out arranged version of potatoes
print(potatoes[order(moistness)])

# Import 20 rows of potatoes.txt with fread(): potatoes_part
potatoes_part <- fread("potatoes.txt",nrows=20)


# Import columns 6, 7 and 8 of potatoes.txt: potatoes
potatoes <- fread("potatoes.txt", select = c(6:8))

# Keep only tasty potatoes (flavor > 3): tasty_potatoes
tasty_potatoes <- subset(potatoes, potatoes$flavor >3)

# Plot texture (x) and moistness (y) of tasty_potatoes
plot(tasty_potatoes$texture, tasty_potatoes$moistness, xlab= "Texture", ylab= "Moistness", main="Greater texture leads to better tasting potatoes!", col="blue", pch=10)


# Load the readxl package
library(readxl)

# Find the names of both spreadsheets: sheets
excel_sheets("latitude.xlsx")

# Print sheets
print(sheets)

# Find out the class of the sheets vector
class(sheets)


# Read the first sheet of latitude.xlsx: latitude_1
latitude_1 <- read_excel("latitude.xlsx",sheet=1)

# Read the second sheet of latitude.xlsx: latitude_2
latitude_2 <- read_excel("latitude.xlsx",sheet= "1900")

# Put latitude_1 and latitude_2 in a list: lat_list
lat_list <- list(latitude_1, latitude_2)

# Display the structure of lat_list
str(lat_list)

# Read all Excel sheets with lapply(): lat_list
lat_list <- lapply(excel_sheets("latitude.xlsx"),read_excel,path="latitude.xlsx")

# Display the structure of lat_list
str(lat_list)


# Import the the first Excel sheet of latitude_nonames.xlsx (R gives names): latitude_3
latitude_3 <- read_excel("latitude_nonames.xlsx",sheet=1,col_names=FALSE)

# Import the the second Excel sheet of latitude_nonames.xlsx (specify col_names): latitude_4
latitude_4 <- read_excel("latitude_nonames.xlsx",sheet=2,col_names=c("country","latitude"))

# Print the summary of latitude_3
print(summary(latitude_3))

# Print the summary of latitude_4
print(summary(latitude_4))


# The readxl package is already loaded

# Import the second sheet of latitude.xlsx, skipping the first 21 rows: latitude_sel
latitude_sel <- read_excel("latitude.xlsx",sheet=2,skip=21,col_names=FALSE)

# Select the first observation from latitude_sel: first
first<-latitude_sel[1,]

# Print first
print(first)

# Load the gdata package 
library(gdata)

# Import the second sheet of urbanpop.xls: urban_pop
urban_pop <- read.xls("urbanpop.xls",sheet=2)

# Print the first 11 observations using head()
head(urban_pop,11)


# Import data from the second sheet; skip the first 50 rows: urban_pop
urban_pop <- read.xls("urbanpop.xls",skip=50,sheet=2,header=FALSE,stringsAsFactors=FALSE)

# Column names for urban_pop
columns <- c("country", paste0("year_", 1967:1974))

# Name the columns of urban_pop
names(urban_pop) <- columns

# Sort the data frame in descending urban population in 1974: urban_pop_sorted
urban_pop_sorted<- urban_pop[order(-urban_pop$year_1974),]

# Print first 10 observation of urban_pop_sorted
head(urban_pop_sorted,10)


# Specify the file path using file.path(): path
path <- file.path("datasets","urbanpop.xls")

# Import all sheets from urbanpop.xls, in datasets folder; strings 
# not as factors: urban_sheet1, urban_sheet2 and urban_sheet3
urban_sheet1 <- read.xls(path,sheet=1,stringsAsFactors=FALSE)
urban_sheet2 <- read.xls(path,sheet=2,stringsAsFactors=FALSE)
urban_sheet3 <- read.xls(path,sheet=3,stringsAsFactors=FALSE)

# Merge the three data frames: urban_all
urban_all <- cbind(urban_sheet1, urban_sheet2[,-c(1)], urban_sheet3[,-c(1)])


# Remove all rows containing NAs: urban_all_clean
urban_all_clean <- na.omit(urban_all)

# Print out a summary of urban_all_clean
summary(urban_all_clean)



# latitude.xlsx is available in your working directory

# Load the XLConnect package
library(XLConnect)

# Build connection to latitude.xlsx: my_book
my_book <- loadWorkbook("latitude.xlsx")

# Print out the class of my_book
class(my_book)

# List the sheets in latitude.xlsx
getSheets(my_book)

# Import the second sheet in latitude.xlsx
readWorksheet(my_book, sheet=2)

# Import the second column of the first sheet in latitude.xlsx
readWorksheet(my_book, sheet=1, startCol=2)

# Create data frame: summ
dims1 <- dim(readWorksheet(my_book, 1))
dims2 <- dim(readWorksheet(my_book, 2))
summ <- data.frame(sheets = getSheets(my_book), 
                   nrows = c(dims1[1], dims2[1]), 
                   ncols = c(dims1[2], dims2[2]))

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book,"data_summary")

# Populate "data_summary" with summ data frame
writeWorksheet(my_book,summ,sheet="data_summary")

# Save workbook as latitude_with_summ.xlsx
saveWorkbook(my_book,"latitude_with_summ.xlsx")


# Load the haven package
library(haven)

# Import sales.sas7bdat: sales
sales <-read_sas("sales.sas7bdat")

# Display the structure of sales
str(sales)

# Copy sales to sales_factorized
sales_factorized <- sales

# Convert purchase, gender and income variables of sales_factorized to factors
sales_factorized[,c(1,3,4)] <- lapply(sales[,c(1,3,4)],as.factor)

# haven is already loaded

# Import the data from the URL: sugar
sugar <- read_dta("http://assets.datacamp.com/course/importing_data_into_r/tra de.dta")

# Print sugar, as well as its structure
print(sugar)
str(sugar)

# Copy sugar to sugar2
sugar2 <- sugar

# Convert values in Date column to dates
sugar2$Date <- as.Date(as_factor(sugar2$Date))

# Print sugar2
print(sugar2)


# haven is already loaded

# Specify the file path using file.path(): path
path <- file.path("datasets","person.sav")

# Import person.sav, which is in the datasets folder: traits
traits <- read_sav(path)

# Summarize traits
summary(traits)

# Create a subset named extro_agree
extro_agree <- subset(traits,traits$Extroversion>40 & traits$Agreeableness >40)

# Import SPSS data from the URL: work
work <- read_sav("http://assets.datacamp.com/course/importing_data_into_r/employee.sav")

# Display the summary of work$GENDER and work$JOBCAT
summary(work$GENDER)
summary(work$JOBCAT)


# Copy work to work2
work2 <- work

# Convert the variables GENDER and JOBCAT in work2 to factors
work2$GENDER <- as_factor(work$GENDER)
work2$JOBCAT <- as_factor(work$JOBCAT)


# Display the summary of work2$GENDER and work2$JOBCAT
summary(work2$GENDER)
summary(work2$JOBCAT)


# Load the foreign package
library(foreign)

# Import florida.dta and name the resulting data frame florida
florida <- read.dta("florida.dta")

# Copy florida to florida_ext
florida_ext <- florida

# Add two columns to florida_ext, percent_gore and percent_bush
florida_ext$percent_gore <- florida$gore/florida$total*100
florida_ext$percent_bush <- florida$bush/florida$total*100


# Specify the file path using file.path(): path
path <- file.path("worldbank","edequality.dta")

# Create and print structure of edu_equal_1
edu_equal_1 <- read.dta(path)
str(edu_equal_1)


# Create and print structure of edu_equal_2
edu_equal_2 <- read.dta(path,convert.factors=FALSE)
str(edu_equal_2)


# Create and print structure of edu_equal_3
edu_equal_3 <- read.dta(path,convert.underscore=TRUE)
str(edu_equal_3)

# How many observations (or how many people) have an age higher than 40 and are literate
nrow(subset(edu_equal_1, age > 40 & literate == "yes"))

# How many observations/individuals from Bulgaria have an income above 1000?
nrow(subset(edu_equal_1, ethnicity_head == "Bulgaria" & income >1000))


# foreign is already loaded

# Import international.sav as a data frame: demo
demo <- read.spss("international.sav",to.data.frame = TRUE)

# Create boxplot of gdp variable of demo
boxplot(demo$gdp)

# Import international.sav as demo_1
demo_1 <- read.spss("international.sav", to.data.frame=TRUE)

# Print out the head of demo_1
head(demo_1)

# Import international.sav as demo_2
demo_2 <- read.spss("international.sav", to.data.frame= TRUE, use.value.labels=FALSE)

# Print out the head of demo_2
head(demo_2)

install.packages("RMySQL")
library(DBI) # library(RMySQL) not required

con <- dbConnect (RMySQL::MySQL(), 
                  dbname="company",
                  host="courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                  port = 3306,
                  user= "student",
                  password="datacamp")


dbListTables(con)

dbReadTable(con,"employees")

dbDisconnect(con)

# Load the DBI package
library(DBI)

# Edit dbConnect() call
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# Print out con
print(con)
str(con)

# Build a vector of table names: tables
tables <- dbListTables(con)

# Display structure of tables
str(tables)

# Import the users table from tweater: users
users <- dbReadTable(con, "users")

# Print users
print(users)

# Import and print the tweats table from tweater: tweats
tweats <- dbReadTable(con,"tweats")
print(tweats)

# Import and print the comments table from tweater: comments
comments <- dbReadTable(con, "comments")
print(comments)

dbGetQuery(con, "select name from employees where started_at > \"2012-09-01\"")

# Import post column of tweats where date is higher than "2015-09-21": latest
latest <- dbGetQuery(con,"select post from tweats where date > \"2015-09-21\"")

# Import tweat_id column of comments where user_id is 1: elisabeth
elisabeth <- dbGetQuery(con,"select tweat_id from comments where user_id = 1")

# Print latest and elisabeth
print(latest)
print(elisabeth)

# Create data frame specific
specific <- dbGetQuery(con, "select message from comments where tweat_id = 77 and user_id > 4")

# Create data frame short
short <- dbGetQuery(con, "select id,name from users where char_length(name)< 5 ")

# Print specific and short
print(specific)
print(short)

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

# Use dbFetch() twice
dbFetch(res,n=2)
dbFetch(res)

# Clear res
dbClearResult(res)


# Create the data frame  long_tweats
long_tweats <- dbGetQuery(con,"select post, date from tweats where char_length(post) >40")

# Print long_tweats
print(long_tweats)

# Disconnect from the database
dbDisconnect(con)

# Load the readr package
library(readr)

# Import the csv file: pools
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
pools <- read_csv(url_csv)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/potatoes.txt"
potatoes <- read_tsv(url_delim)

# Print pools and potatoes
print(pools)
print(potatoes)


con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# Connecting to Oracle
library(DBI)
drv <- dbDriver("Oracle")

# Create the connection string
host <- "adc2100958"
port <- 1521
sid <- "orff"
connect.string <- paste(
    "(DESCRIPTION=",
    "(ADDRESS=(PROTOCOL=tcp)(HOST=", host, ")(PORT=", port, "))",
    "(CONNECT_DATA=(SID=", sid, ")))", sep = "")
con <- dbConnect(drv, username = "scott",
                 password = "tiger",dbname=connect.string)


# https URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"

# Import the file using read.csv(): pools1
pools1 <- read.csv(url_csv)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2 <- read_csv(url_csv)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)

# Load the readxl and gdata package
library(readxl)
library(gdata)

# Specification of url: url_xls
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/latitude.xls"

# Import the .xls file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url_xls,"local_latitude.xls")

# Import the local .xls file with readxl: excel_readxl (cannot take directly from url yet)
excel_readxl <- read_excel("local_latitude.xls")


# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/wine.RData"

# Download the wine file to your working directory
download.file(url_rdata,"wine_local.RData")

# Load the wine data into your workspace using load()
load("wine_local.RData")

# Print out the summary of the wine data
summary(wine)

# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url)

# Print resp
print(resp)

# Get the raw content of resp
raw_content <- content(resp,as="raw")

# Print the head of content
head(raw_content)


# Get the url
url <- "https://www.omdbapi.com/?t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
print(resp)

# Print content of resp as text
resp <- GET(url)
print(content(resp,as="text"))

# Print content of resp
print(content(resp))

# Load the jsonlite package
library(jsonlite)

# Convert wine_json to a list: wine
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'
wine <- fromJSON(wine_json)

# Import Quandl data: quandl_data
quandl_url <- "http://www.quandl.com/api/v1/datasets/IWS/INTERNET_INDIA.json?auth_token=i83asDsiWUUyfoypkgMz"

quandl_data <- fromJSON(quandl_url)
# Print structure of wine and quandl_data
str(wine)
str(quandl_data)

# jsonlite is already loaded

# Experiment 1
json1 <- '[1, 2, 4, 6]'
json1 <- '[1, 2, 3, 4, 5, 6]'
fromJSON(json1)

# Experiment 2
json2 <- '{"a": [1, 2, 3]}'
json2 <- '{"a": [1, 2, 3], "b": [4,5,6]}'
fromJSON(json2)

# Experiment 3
json3 <- '[[1, 2], [3, 4], [5, 6]]'
json3 <- '[[1,2],[3,4]]'
fromJSON(json3)

# Experiment 4
json4 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}]'
json4 <- '[{"a":1,"b":2},{"a":3,"b":4},{"a":5,"b":6}]'
fromJSON(json4)

# The package jsonlite is already loaded

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

# Print out the Title element of both lists
print(sw4$Title)
print(sw3$Title)


# Is the release year of sw4 later than sw3?
print(sw4$Year > sw3$Year)


# jsonlite is already loaded

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/water.csv"

# Import the .csv file located at url_csv
water <- read.csv(url_csv, stringsAsFactors = FALSE)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out water_json
print(water_json)

# jsonlite is already loaded

# Convert mtcars to a pretty JSON: pretty_json
pretty_json <- toJSON(mtcars,pretty=TRUE)

# Print pretty_json
print(pretty_json)

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
print(mini_json)

