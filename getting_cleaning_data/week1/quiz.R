download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "survey.csv")
survey <- read.csv("survey.csv")
names(survey)
dim(subset(survey, survey$VAL==24))[1]
# Odgovor: 53
# only one type of observation per table  -- NOT
# only one type of obs per row - NOT

dat<-read.xlsx("gas.xlsx", sheetIndex=1, colIndex=7:15, rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T)
# 36534720

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", "baltimore.xml")
doc<-xmlTreeParse("baltimore.xml", useInternal=TRUE)
root <- xmlRoot(doc)
zipcodes<-xpathSApply(root, "//zipcode",xmlValue)
length(zipcodes[zipcodes=="21231"])
# 127

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "2006.csv")
DT <- fread("2006.csv")


rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

print("2")
DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])

print("3")
sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

print("4")
tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

print("5")
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))

# 6
mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))

## sapply is fastest