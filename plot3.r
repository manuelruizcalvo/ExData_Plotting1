datos <- read.table("household_power_consumption.txt",sep=";",dec=".", header=TRUE,na.strings = "?",colClasses=c(rep("character",2),rep("numeric",7)))

datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
filterDate1 <- as.Date("2007-02-01")
filtro1 <- datos$Date == filterDate1
datosFiltrados1 <- datos[filtro1,]
filterDate2 <- as.Date("2007-02-02")
filtro2 <- datos$Date == filterDate2
datosFiltrados2 <- datos[filtro2,]
datosFiltrados <- rbind(datosFiltrados1,datosFiltrados2)
datosFiltrados$Date <- as.character(datosFiltrados$Date)
datosFiltrados["DateTime"] <- paste(datosFiltrados$Date,datosFiltrados$Time,sep=" ")
datosFiltrados$DateTime <-strptime(datosFiltrados$DateTime,"%Y-%m-%d %H:%M:%S")

png(filename="plot3.png", width=480, height=480)
plot(datosFiltrados$DateTime,datosFiltrados$Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering")
points(datosFiltrados$DateTime,datosFiltrados$Sub_metering_2,type="l",col="red")
points(datosFiltrados$DateTime,datosFiltrados$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd="2")
dev.off()
