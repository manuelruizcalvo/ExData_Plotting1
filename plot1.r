datos <- read.table("household_power_consumption.txt",sep=";",dec=".", header=TRUE,na.strings = "?",colClasses=c(rep("character",2),rep("numeric",7)))
datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
filterDate1 <- as.Date("2007-02-01")
filtro1 <- datos$Date == filterDate1
datosFiltrados1 <- datos[filtro1,]
filterDate2 <- as.Date("2007-02-02")
filtro2 <- datos$Date == filterDate2
datosFiltrados2 <- datos[filtro2,]
datosFiltrados <- rbind(datosFiltrados1,datosFiltrados2)
png(filename="plot1.png", width=480, height=480)
hist(datosFiltrados$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main="Global Active Power")
dev.off()
