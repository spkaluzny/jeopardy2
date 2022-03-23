one_game <- function(id) {
  # id: character "#n" => show number (starting Sept 1984)
  #     integer n => JArchive game number, 1 is Ken Jennings 2004-09-06 game
  z <- suppressWarnings(try(
     whatr::whatr_data(id), silent=TRUE))
  if(class(z) == "try-error") {
    cat(id, "\n", file="whatr_problem.txt", append=TRUE)
    return(NULL)
  }
  s3 <- scores3(z$scores)
  if(length(intersect(z$players$first, z$summary$name)) !=
    length(z$summary$name)) {
    cat(id, setdiff(z$players$first, z$summary$name),
      setdiff(z$summary$name, z$players$first), "\n",
      file="whatr_name_first_problem.txt", append=TRUE)
    indx_msn <- which(match(z$summary$name, z$players$first, nomatch=-1) < 0)
    indx_mpf <- which(match(z$players$first, z$summary$name, nomatch=-1) < 0)
    z$players$first[indx_mpf]  <- z$summary$name[indx_msn]
  }
  og <- cbind(z$info, z$players) |>
    dplyr::left_join(z$summary, by=c("first"="name")) |>
    dplyr::left_join(s3, by=c("first"="name"))
  og
}

scores3 <- function(d) {
  nam <- unique(d$name)
  r0 <- data.frame(round=1, name=nam, score=rep(0, 3))
  s3 <- d |> dplyr::select(round, name, score) |> rbind(r0) |>
    dplyr::group_by(name, round) |>
    dplyr::summarise(value = sum(score), .groups="drop")
  z3 <- tapply(s3[["value"]], s3[["name"]], cumsum)
  z3 <- lapply(z3, function(y) {
    if(length(y) == 2) {
      y <- c(y, y[2])
    }
    y
   })
  d3 <- as.data.frame(do.call(rbind, z3))
  names(d3) <- c("round1", "round2", "round3")
  cbind(name=row.names(d3), d3)
}
