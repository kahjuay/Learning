# movies is already pre-loaded

# Display the structure of movies
str(movies)

# Plot the genre variable of movies
plot(movies$genre)

# Plot the genre variable against the rating variable
plot(movies$genre, movies$rating)

# Create a histogram for rating
hist(movies$rating)

# Create a histogram for rating, with 20 bins
hist(movies$rating, breaks=20)

# Create a boxplot of the runtime variable
boxplot(movies$runtime)

# Subset the dateframe and plot it entirely
plot(subset(movies,select=c(rating:runtime)))

# Create a pie chart of the table of counts of the genres
pie(table(movies$genre))

# Chart default parameters
par()

# Specific chart parameters
par()$col

# Set parameter default
par(col = "blue")

# Create a customized plot
plot(movies$votes, movies$runtime,
     main = "Votes versus Runtime",
     xlab = "Number of votes [-]",
     ylab = "Runtime [s]",
     sub = "No clear correlation",
     pch = 9,
     col = "#dd2d2d",
     col.main = 604,
     cex.axis= 0.8)

# Build a customized histogram
hist(movies$runtime,
	xlim =c(90,220),
	main="Distribution of Runtime",
	xlab= "Runtime [-]", 
	col="cyan", 
	border="red",
	breaks=20)
	
# Multiple plots
par(mfrow = c(2,2))
par(mfcol = c(2,2))
par(mfrow = c(1,1))
layout(1)
old_par <- par()

# List all the graphical parameters
par()

# Specify the mfrow parameter
par(mfrow = c(2,1))

# Build two plots
plot(movies$votes, movies$rating)
hist(movies$votes)


# Build the grid matrix
grid <- matrix(c(1,2,3,3), nrow=2)

# Specify the layout
layout(grid)

# Build three plots
plot(movies$rating, movies$runtime)
plot(movies$votes, movies$runtime)
boxplot(movies$runtime)

# Customize the three plots
plot(movies$rating, movies$runtime, pch=4, xlab="Rating", ylab="Runtime")
plot(movies$votes, movies$runtime, xlab="Number of Votes", ylab="Runtime", col = "blue")
boxplot(movies$runtime, border="darkgray", main ="Boxplot of Runtime")


# Fit a linear regression: movies_lm
movies_lm <- lm(movies$rating ~ movies$votes)

# Build a scatterplot: rating versus votes
plot(movies$votes, movies$rating)

# Add straight line to scatterplot
plot(movies$votes, movies$rating, abline(coef(movies_lm)))

# Customize scatterplot
plot(movies$votes, movies$rating, main ="Analysis of IMDb data",xlab="Number of Votes",ylab="Rating",col="darkorange",pch=15,cex=0.7)

# Customize straight line
abline(coef(movies_lm),col="red", lwd=2)

# Add text
xco <- 7e5
yco <- 7
text(xco, yco, label="More votes? Higher rating!")


#The first plot is a scatterplot of experience versus salary (green points) with a red linear regression line. The x-axis is labeled "Experience" and the y-axis is titled "Salary".
#The second plot is a blue histogram of the salary variable. The x-axis should be labelled "Salary".
#The third plot displays a boxplot for salary versus each level of the degree variable. The x-axis should be called "Level of degree", whereas the y-axis should be named "Salary".

# OPTION A
par(mfrow = c(1,3))
plot(salaries$degree, salaries$salary, 
     xlab = "Level of degree", ylab = "Salary")
coef_lm <- coef(lm(salaries$salary ~ salaries$experience))
abline(coef_lm, col = "red")
hist(salaries$salary, col = "blue", xlab = "Salary")
plot(salaries$experience, salaries$salary, 
     col="green", xlab = "Experience", ylab = "Salary")

# OPTION B
par(mfrow = c(1,3))
plot(salaries$experience, salaries$salary, 
     col="green", xlab = "Experience", ylab = "Salary")
coef_lm <- coef(lm(salaries$salary ~ salaries$experience))
abline(coef_lm, col = "red")
hist(salaries$salary, col = "blue", xlab = "Salary")
plot(salaries$degree, salaries$salary, 
     xlab="Level of degree", ylab = "Salary")

# OPTION C
par(mfrow = c(3,1))
plot(salaries$experience, salaries$salary,
     col="green",xlab="Experience",ylab="Salary")
coef_lm <- coef(lm(salaries$salary~salaries$experience))
abline(coef_lm,col="red")
hist(salaries$salary, col="blue", xlab = "Salary")
plot(salaries$degree, salaries$salary,
     xlab = "Level of degree", ylab = "Salary")