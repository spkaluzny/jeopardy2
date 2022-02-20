#!/usr/bin/env /usr/local/bin/Rscript
# id <- 1:200
# 4 player games:
# id <- c(940L, 1347L, 1349L, 1933L, 1936L, 1940L, 1970L, 1982L)
id <- 5001:7288
data_file <- here::here(file.path("data", "game_player_score.txt"))
if(file.exists(data_file)) {
  cnames.p <- FALSE
  append.p <- TRUE
} else {
  cnames.p <- TRUE
  append.p <- FALSE
}
source(here::here(file.path("R", "get_one_game.R")))
dall <- NULL
for(i in id) {
  cat(i, "\n")
  di <- one_game(i)
  dall <- rbind(dall, di)
}
write.table(dall, data_file, sep="|",
   row.names=FALSE, append=append.p, col.names=cnames.p)
