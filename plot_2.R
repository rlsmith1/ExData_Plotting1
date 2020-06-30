

# libraries ---------------------------------------------------------------


       library(tidyverse)
       library(lubridate)
       library(purrr)




# load data --------------------------------------------------------------------


       # download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
       #               destfile = "Exploratory Data Analysis/Week 1/data.zip")
       
       
       #unzip("Exploratory Data Analysis/Week 1/data.zip")
       
       df_power <- read.table("Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep = ";") %>% 
              as_tibble() 




# format data -------------------------------------------------------------


       #column names
       
       names(df_power) <- as.character(unlist(df_power[1,]))
       
       df_power <- df_power[-1,]
       
       
       # convert to numerics
       
       df_power[3:9] <- df_power[3:9] %>% map(~as.numeric(as.character(.x)))


       
       # convert to date/time class
       
       df_power <- df_power %>% unite("datetime", 1:2, sep = " ")
       
       df_power$datetime <- dmy_hms(df_power$datetime)

       
       # only using data from 2007-02-01 and 2007-02-02
       
       df_power <- df_power %>% filter(grepl("^2007-02-01", datetime) | grepl("^2007-02-02", datetime))
       

       
# plot ----------------------------------------------------------



plot(x = df_power$datetime, 
     y = df_power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")




