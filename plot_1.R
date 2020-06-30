



# libraries ---------------------------------------------------------------


       library(tidyverse)
       library(purrr)




# load data --------------------------------------------------------------------


       download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                     destfile = "Exploratory Data Analysis/Week 1/data.zip")
       
       
       #unzip("Exploratory Data Analysis/Week 1/data.zip")
       
       df_power <- read.table("Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep = ";") %>% 
              as_tibble() 




# format data -------------------------------------------------------------


       #column names

       names(df_power) <- as.character(unlist(df_power[1,]))
       
       df_power <- df_power[-1,]

       
       # convert to numerics
       
       df_power[3:9] <- df_power[3:9] %>% map(~as.numeric(as.character(.x)))



# plot histogram ----------------------------------------------------------


       hist(df_power$Global_active_power, 
            col = "red",
            main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)")

       

# save as png -------------------------------------------------------------

       dev.copy(png, file = "Exploratory Data Analysis/Week 1/ExData_Plotting1/plot_1.png",
                height = 480, width = 480)
              
       dev.off()












