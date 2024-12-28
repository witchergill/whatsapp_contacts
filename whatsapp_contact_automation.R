#contacts updating process

#error free auto signup download code with urban vpn connected
pkgs<-rownames(installed.packages())

if(!('tidyverse' %in% pkgs)){
  install.packages("tidyverse")
}
if(!('RSelenium' %in% pkgs)){
  install.packages("RSelenium")
}
if(!('netstat' %in% pkgs)){
  install.packages("netstat")
}
if(!('rvest' %in% pkgs)){
  install.packages("rvest")
}
library(tidyverse)
library(RSelenium)
library(netstat)
library(rvest)

#googledrive::drive_auth(email = 'ap.kheloyaar@gmail.com',cache  = '.secretsap')
#googlesheets4::gs4_auth(token = googledrive::drive_token())


assign(x = "rd",value = tryCatch(rsDriver(browser = 'firefox',port = free_port(T),verbose = T,version = 'latest',chromever = NULL),error=function(e){
  assign(x='rd',value=rsDriver(browser = 'firefox',port = free_port(T),verbose = T,version = 'latest',chromever = NULL),envir = .GlobalEnv)
}),envir = .GlobalEnv)

assign(x="remDr",value = rd$client,envir = .GlobalEnv)



#opening the panel sites in different tabs of browser

remDr$navigate("https://web.whatsapp.com/")

for(j in 1:90){
  cat('time left : ',90-j,"\n")
  Sys.sleep(1)
}

#page.data<-remDr$getPageSource()[[1]]
#data<-read_html(page.data)
#contact<-html_nodes(data,"[class=_amid]")  #[style='min-height: 0px;']
#contact<-html_nodes(data,"[class=_ao3e]")  #[style='min-height: 0px;']
#html_text(contact)
a<-remDr$findElement(using = 'class',value = '_amid')
contacts.data<-unlist(str_split(a$getElementText(),","))
contacts.data<-str_remove_all(contacts.data," |[^a-zA-Z0-9]")
contacts.data<-str_remove_all(contacts.data,"[a-z|A-Z]")

contacts.data<-unlist(lapply(contacts.data,function(e) if(e==""){e=NA}else{e}))
contacts.data<-contacts.data[!is.na(contacts.data)]
write.csv(contacts.data,"contacts_info.csv")
