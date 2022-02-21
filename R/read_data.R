dfile <- "game_player_score.txt"
dpath <- here::here(file.path("data", dfile))
d <- read.table(dpath, header=TRUE, sep="|", quote='"', comment="")
