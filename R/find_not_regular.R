indx_tournament <- grep("tournament", d[["comments"]], ignore.case=TRUE)  
indx_championship <- grep("championship", d[["comments"]], ignore.case=TRUE)
indx_super_jeopardy <- grep("Super Jeopardy", d[["comments"]], ignore.case=TRUE)
indx_celebrity <- grep("celebrity", d[["comments"]], ignore.case=TRUE)
indx_battle <- grep("\\bbattle\\b", d[["comments"]], ignore.case=TRUE)
indx_kids <- grep("\\bkids week\\b", d[["comments"]], ignore.case=TRUE)
indx_power <- grep("\\bpower players\\b", d[["comments"]], ignore.case=TRUE)
indx_backtoschool <- grep("\\bback to school\\b", d[["comments"]], ignore.case=TRUE)
indx_goat <- grep("\\bgreatest of all time\\b", d[["comments"]], ignore.case=TRUE)
# indx_teen <- grep("\\bteen\\b", d[["comments"]], ignore.case=TRUE)
#indx_million <- grep("\\bmillion dollar\\b", d[["comments"]], ignore.case=TRUE)
# indx_super <- grep("\\bsuper\\b", d[["comments"]], ignore.case=TRUE)
# This only gets the "Alex announces The IBM Challenge" game:
# indx_watson <- grep("\\bthe ibm challenge\\b", d[["comments"]], ignore.case=TRUE)
indx_quarterfinal <- grep("quarterfinal", d[["comments"]], ignore.case=TRUE) 
indx_semifinal <- grep("semifinal", d[["comments"]], ignore.case=TRUE) 
indx_final <- grep("\\bfinal game", d[["comments"]], ignore.case=TRUE) 

indx_not_regular <- sort(unique(c(
  indx_tournament,
  indx_championship,
  indx_super_jeopardy,
  indx_celebrity,
  indx_battle,
  indx_kids,
  indx_power,
  indx_backtoschool,
  indx_goat,
  indx_quarterfinal,
  indx_semifinal,
  indx_final
)))

# Keep games: 3970 4085 4305 4364,
# Regular game with the word Tournament or Battle in comment:
indx_3970 <- which(d[["game"]] == 3970)
indx_not_regular <- setdiff(indx_not_regular, indx_3970)
indx_4085 <- which(d[["game"]] == 4085)
indx_not_regular <- setdiff(indx_not_regular, indx_4085)
indx_4305 <- which(d[["game"]] == 4305)
indx_not_regular <- setdiff(indx_not_regular, indx_4305)
indx_4364 <- which(d[["game"]] == 4364)
indx_not_regular <- setdiff(indx_not_regular, indx_4364)
