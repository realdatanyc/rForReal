#R Projects for Dummies
# Joseph Schmuller, PHD
# Published in 2018

#INTRODUCTION

#6 PARTS / 17 CHAPTERS

# PART 1: THE TOOLS OF THE TRADE
# CHAPTER 1 R: What It Does and How It Does It
x <- c(5, 10, 15, 20, 25, 30, 35, 40)
x
y <- seq(5,40,5)
y
z <- seq(to=40,by=5,from=5)
z
?seq

hypotenuse <- function(a,b){ #list the arguments
  hyp <- sqrt(a^2+b^2) # perform the computation
    return(hyp) #return the value
}

hypotenuse(3,4)

# A vector is an array of the same type

beatles <- c("john", "paul", "george", "ringo")
beatles

#logical vector
w <- c(T,F,F,T,T,F)
w

beatles[2:3]

beatles[c(2,4)]

y <- seq(5,40,5)
y

y <- seq(5,40)
y <- 5:40 #special syntax for seq when increasing by 1
y

#r is repeating values

quadrifecta <- c(7,8,4,3)
repeated_quadrifecta <- rep(quadrifecta,3)
repeated_quadrifecta

#supplying vector as the second argument
rep_vector <-c(1,2,3,4)

repeated_quadrifecta <- rep(quadrifecta,rep_vector)
repeated_quadrifecta #second argument states the number of times each element is repeated

xx <- c(3,4,5)
xx
xx <- append(xx,6)
xx
xx <- append(xx,7)
xx


length(xx)

# matrix is row, column dimension of data elements of the same type

num_matrix <- seq(5, 100, 5) #create a vector squencing by 5 from 5 to 10

dim(num_matrix) <- c(5,4) #turn a vector into a 2 - dimensional matrix

num_matrix

# note numbers increment per each row down a single column

# to transpose:
t(num_matrix)

#another way to create matrices 
num_matrix <- matrix(seq(5, 100,5), nrow=5)

num_matrix

#fill by row using matrix function (byrow=T) - transpose
num_matrix <- matrix(seq(5,100,5), nrow=5, byrow=T)

num_matrix

#use row number, column number
num_matrix[3,4]
num_matrix[5,4]

#whole row
num_matrix[3,]

#whole column - note: displays as a row in the console pane
num_matrix[,2]

# 3 dimensional array
HairEyeColor

# list - a collection of objects that aren't necessarily the same type

beatles <- c("john", "paul", "george", "ringo")

ages <- c(17, 15, 14, 22)

beatles_info <- list(names=beatles, age_joined=ages)

beatles_info

beatles_info$names

beatles_info$names[4]

#critera in brackets

beatles_info$names[beatles_info$age_joined > 16]

# output  beatles_info$names[beatles_info$age_joined > 16]
#[1] "john"  "ringo"
#> 
#@@@ intelligence report:  Hudson Yards
#@@@ intellgence report:  Long Island City
#@@@ inteligence report: Manhattan Rentals
#@@@ intelligence report: West Chelsea

# Data frames

name <- c("al", "barbar", "charles","donna", "ellen","fred")
height <- c(72, 64, 73, 65,66,71)
weight <- c(195,117,205,122,125,199)
gender <- c("M","F","M","F","F","M")

#turn text into categories / aka factors
factor_gender <-factor(gender)
factor_gender

# the function data.fram() works with the vectors to create a data frame
d<- data.frame(name,factor_gender,height,weight)
d

address <- c("160 West 73rd Street","151 West 82nd Street", "45 West 139th Street")
type <-c("rental","rental","rental")
beds <- c(0,0,0)
rent <- c(2012, 1650, 1590)
factor_type <- factor(type)

l <- data.frame(address, factor_type, beds, rent)
l

# mod %%
xx <- c(2,3,4,5,6)

yy <- NULL

for(i in 1:length(xx)){
  if(xx[i] %% 2 == 0) {yy[i] <- "EVEN"}
else{yy[i] <- "ODD"}
}
xx
yy

# CHAPTER 2: Working with Packages

#A package is a collection of fuctions and data that augments R.

library(datasets)

library(MASS)

#show the first six rows of a dataframe
head(airquality)

#show the final six rows of a dataframe
tail(airquality)

# there are NA valuess
mean(airquality$Ozone)

# need to remove them
mean(airquality$Ozone, na.rm=TRUE)

# the rm in na.rm means "remove,", and = TRUE means "get it done."

#Subsets

Month.Day.Ozone <- subset(airquality, select = c(Month,Day,Ozone))
Month.Day.Ozone

August.Ozone <- subset(airquality, Month == 8, select = c(Month,Day,Ozone))
head(August.Ozone)

# R Formulas

# basic structure of an R formula
# function(dependent_var ~ independent_avr, data = data.frame)
# ~ means "depends on."

#lm means "linear model"
analysis <- lm(Temp ~ Month, data=airquality)

summary(analysis)

# for more explanation on statistical interpretation, see "Statistical Analysis with R for Dummies"
# https://www.amazon.com/Statistical-Analysis-Dummies-Computers/dp/1119337062

s <- summary(analysis)
s$coefficients[2,1]

analysis
# Comprehensive R Archive Network (CRAN)

#install tidyverse
install.packages("tidyverse")

#use tiydr - Tidy Messy Data
library(tidyr)

aq.no.missing <- drop_na(airquality)
head(aq.no.missing) 

head(airquality)

# tibbles are modern reimangining of a data frame
# https://tibble.tidyverse.org/
library(tibble)

https://www.rdocumentation.org/

space.revenues["satellite Services",2]

# need to find space dataset: 7/4
revenues.industry <-rownames_to_column(space.revenues, var="Industry")

long.revenues <-gather(revenues.Industry, Year,Million_Dollars,2:6)

spread(long.revenues,YEar,Million_Dollars)

filter(long.revenues, Industry ="Satellite Services")
#future

#use dplyr library
# dplyr - is a data manipulation library
# https://dplyr.tidyverse.org/
library(dplyr)
#https://tidyr.tidyverse.org/reference/drop_na.html

# searching for space files, found:
# https://www.bts.gov/content/worldwide-commercial-space-launches

# CHAPTER 3 - Getting Graphic
# graphics_function(data, argument1, argument2, ...)

library(datasets)
head(airquality)

#histogram
hist(airquality$Temp)

hist(airquality$Temp, xlab="Temperature (Degrees Fahrenheit)", main="Temperatures in New York City May 1 - September 30, 1973")

#probability / desity plots; instead of frequency, show the density
hist(airquality$Temp, xlab="Temperature (Degrees Fahrenheit)", main="Temperatures in New York City May 1 - September 30, 1973", probability = TRUE)

lines(density(airquality$Temp))

#@@@human search engine for real estate

library(MASS)

head(Cars93[1:3])

#shows frequency of each TYPE of car
table(Cars93$Type)

barplot(table(Cars93$Type))

#formatting adjustments

barplot(table(Cars93$Type), ylim=c(0,25),xlab="Type",ylab="Frequency",axis.lty="solid",space=.5)

#grouping bars

library(datasets)
females <- HairEyeColor[,,2]
females

color.names = c("black","grey40", "grey80", "white")

#transpose
t(females)

barplot(t(females),beside=T,ylim=c(0,70),xlab="Hair Color", ylab="Frequency of Eye Color", col=color.names,axis.lty="solid")

legend("top", rownames(t(females)), cex=0.8,fill=color.names,title="Eye Color")

#grab olr dat
listings <- read.csv("upto450.csv", header = TRUE)
head(listings)
listings

library(datasets)
#pch = "plot character color"
plot(airquality$Wind,airquality$Temp, pch=16, xlab = "Wind Velocity (MPH)", ylab="Temperature (Fahrenheit)", main = "Temperature vs Wind Velolcity")

#boxplot
boxplot(Temp ~ Month, data=airquality, xaxt = "n")

axis(1, at=1:5, labels=c("May", "June", "July", "August", "september"))

# ggplot2
# Hadley Wickham incorporates the "Grammar of Graphics" by Leland Wilkinson
install.packages("ggplot2")
library(ggplot2)

#r for real estate
# building blocks of data intelligence
# Intelligence reports that provde predictive analytics and data visualization, use Brick Underground as a reference point
# common compoinents:
# data
# coordiate system
# statistical transformations
# objects with a graph
#ggplot function takes 2 arguments:  data source, map of the data components, aes -- aesthetic mapping, individual argments in aes are aesthetics

#just the data source mapping 
ggplot(airquality, aes(x=Temp))

ggplot(airquality, aes(x=Temp)) +
  geom_histogram()

ggplot(airquality,aes(x=Temp)) +
  geom_histogram(binwidth=5,color = "black",fill="grey80")+
  theme_bw() +
  labs(x = "Temperature (Fahrenheit)" ,y="Frequency", title="Temperatures in the airquality Data Frame")

library(MASS)
ggplot(Cars93, aes(x=Type)) +
  geom_bar()+
  labs(y="Frequency", title="Car Type and Frequency in Cars93")