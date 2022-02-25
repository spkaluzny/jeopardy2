# Fix occupation and from
from2 <- d[["from"]]
occupation2 <- d[["occupation"]]
last2 <- d[["last"]]
# occupation includes "JR.," at start, add to end of last:
indx_jr <- grep("\\bjr\\., ", occupation2, ignore.case=TRUE)
if(length(indx_jr) > 0) {
  occupation2[indx_jr] <- gsub("^JR\\., ", "", occupation2[indx_jr])
  last2[indx_jr] <- paste0(last2[indx_jr] , ", Jr.")
}
# occupation include "Originally" at the end, remove:
occupation2 <- gsub(" Originally$", "", occupation2)
# No occupation, just the word "From", set to NA:
indxFrom <- which(occupation2 == "From")
if(length(indxFrom) > 0) {
  occupation2[indxFrom] <- NA
}
# No occupation, just the word "Originally", set to NA:
indxOriginally <- which(occupation2 == "Originally")
if(length(indxOriginally) > 0) {
  occupation2[indxOriginally] <- NA
}
# occupation starts with "From" and from is NA, swap:
indxOccHasFromStart <- grep("^From ", occupation2)
indxFromNA <- which(is.na(from2))
indxOccToFrom <- intersect(indxOccHasFromStart, indxFromNA)
if(length(indxOccToFrom) > 0) {
  from2[indxOccToFrom] <- occupation2[indxOccToFrom]
  occupation2[indxOccToFrom] <- NA
}
# occupation ends with "From", remove it:
indxOccHasFromEnd <- grep("\\sFrom$", occupation2)
if(length(indxOccHasFromEnd) > 0) {
  occupation2[indxOccHasFromEnd] <- gsub("\\sFrom$", "",
    occupation2[indxOccHasFromEnd])
}
# Remove "From" from the from variable:
from2 <- gsub("^From ", "", from2)
from2 <- gsub(" From$", "", from2)
# Fix know misspelled / problem from values:
fixfrom <- function(x, old, new) {
  indx <- which(x == old)
  if(length(indx) > 0) {
    x[indx] <- new
  }
  x
}
from2 <- fixfrom(from2, "New York City", "New York, New York")
from2 <- fixfrom(from2, "The Bronx", "New York, New York")
from2 <- fixfrom(from2, "West Hartford", "West Hartford, Connecticut")
from2 <- fixfrom(from2, "Lynn Massachusetts", "Lynn, Massachusetts")
from2 <- fixfrom(from2, "San Francisco", "San Francisco, California")
from2 <- fixfrom(from2, "San Jose California", "San Jose, California")
from2 <- fixfrom(from2, "Kansas City", "Kansas City, Missouri")
from2 <- fixfrom(from2, "ST. Louis", "St. Louis, Missouri")
from2 <- fixfrom(from2, "New York State", "New York")
from2 <- fixfrom(from2, "Carmel Valley", "Carmel Valley, California")
from2 <- fixfrom(from2, "Easton Maryland", "Easton, Maryland")
from2 <- fixfrom(from2, "Trinidad And Tobago And Now In New York",
  "New York, New York")
from2 <- fixfrom(from2, "Sandy Mannix", NA)
# Add revised last2, from2 and occpation2 to the original data:
d[["last2"]] <- last2
d[["from2"]] <- from2
d[["occupation2"]] <- occupation2
