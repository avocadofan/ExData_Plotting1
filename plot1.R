source('getdata.R')
png(filename = "plot1.png",
    width = 480,
    height = 480)

with(
  powerdata,
  hist(
    Global_active_power,
    breaks = 15,
    col = 'red',
    xlab = "Global Active Power (kilowatts)",
    main = "Active Global Power"
  )
)

dev.off()