#Generate the url extensions
##IMPORTANT NOTE: Unlike other three leagues, NBA birthday page does not include data on
##whether player is current. This scraper outputs ALL birthdays, which must be cross-
##referenced against NBA 2013-2014 participants.
nbascraper<-function(){
  library(XML)
  string <- vector()
  string2 <- vector()
  for (i in 1:12){
  month_added <- paste(toString(i),"&day=",sep="")
  string<-append(string,month_added)
}
for(i in 1:12){
  placeholder<-string[i]
  for(j in 1:31){
    day_added<-paste(placeholder,toString(j),sep="")
    string2<-append(string2,day_added)
  }  
}
#Create empty drame
finalframe<-data.frame(names=character(),years=character(),dates=character(),stringsAsFactors=FALSE)

#loop extensions and parse into three columns
for(i in 1:length(string2)){
url<-paste("http://www.basketball-reference.com/friv/birthdays.cgi?month=",string2[i],sep="")
parse<-as.data.frame(readHTMLTable(url))
playernames<-as.character(parse$stats.Player)
years<-as.character(parse$stats.Born)
dateint1<-unlist(strsplit(substr(url,62,100),"&day="))
dateint2<-paste(dateint1[1],dateint1[2],".",sep=".")
dates<-paste(rep(dateint2,length(playernames)))

newtable<- as.data.frame(cbind(playernames,years,dates))
finalframe<-rbind(finalframe,newtable)
}

write.csv(finalframe,file="nba.csv")
}

