require(data.table)
require(lubridate)

WD <- getwd()

if (!file.exists("household_power_consumption.txt"))
{
  url <-
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- file.path(WD, "household_power_consumption.zip")
  if (!file.exists(filename)) {
    download.file(url, filename, mode = "wb")
  }
  unzip(filename)
}
datafile <- file.path(WD, "household_power_consumption.txt")
#powerdata <- read.table(datafile,header=TRUE,sep=";",na.strings="?",skip=grep("1/2/2007",readLines(datafile)),nrows=2880)
powerdata <- fread(datafile,
                   sep = ";",
                   na.strings = "?",
                   skip = "1/2/2007",
                   nrows=2880)
names(powerdata) <-
  c(
    "Date",
    "Time",
    "Global_active_power",
    "Global_reactive_power",
    "Voltage",
    "Global_intensity",
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  )

powerdata$DateTime <- paste(powerdata$Date,powerdata$Time)
powerdata$DateTime <- parse_date_time(powerdata$DateTime, 'd/m/Y H:M:S')
