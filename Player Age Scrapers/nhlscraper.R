#Generate the url extensions
nhlscraper<-function(){
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
finalframe<-data.frame(names=character(),years=character(),dates=character(),until=character(),stringsAsFactors=FALSE)

#loop extensions and parse into four columns
for(i in 1:length(string2)){
url<-paste("http://www.hockey-reference.com/friv/birthdays.cgi?month=",string2[i],sep="")
parse<-as.data.frame(readHTMLTable(url))
playernames<-as.character(parse$stats.Player)
years<-as.character(parse$stats.Born)
untils<-as.character(parse$stats.To)
dateint1<-unlist(strsplit(substr(url,58,100),"&day="))
dateint2<-paste(dateint1[1],dateint1[2],".",sep=".")
dates<-paste(rep(dateint2,length(playernames)))

newtable<- as.data.frame(cbind(playernames,years,dates,untils))
finalframe<-rbind(finalframe,newtable)
}
#selects active players only, delete if you want all
finalframe_2014<-subset(finalframe,untils=="2014")

write.csv(finalframe_2014,file="nhl_2014.csv")
}

