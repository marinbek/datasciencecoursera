acs <- read.csv('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv')
sqldf("select pwgtp1 from acs where AGEP < 50")
length(uniques)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

for (i in c(10, 20, 30, 100)) {
  print(nchar(htmlCode[i]))
}

# 5. zadatak
x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4,
  widths=c(15,4,4,9,4,9,4,9,4))

head(x)

sum(x$V4)