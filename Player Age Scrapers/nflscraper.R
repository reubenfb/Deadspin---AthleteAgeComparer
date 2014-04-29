#Generate the url extensions
nflscraper<-function(){
  require(XML)
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
url<-paste("http://www.pro-football-reference.com/friv/birthdays.cgi?month=",string2[i],sep="")
parse<-as.data.frame(readHTMLTable(url))
playernames<-as.character(parse$birthdays.)
years<-as.character(parse$birthdays.Born)
untils<-as.character(parse$birthdays.To)
dateint1<-unlist(strsplit(substr(url,64,100),"&day="))
dateint2<-paste(dateint1[1],dateint1[2],".",sep=".")
dates<-paste(rep(dateint2,length(playernames)))

newtable<- as.data.frame(cbind(playernames,years,dates,untils))
finalframe<-rbind(finalframe,newtable)
}
#selects active players only, delete if you want all
finalframe_2013<-subset(finalframe,untils=="2013")

write.csv(finalframe_2013,file="finalframe_2013.csv")
}

