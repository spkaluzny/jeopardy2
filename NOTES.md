## Column from problem

National College Championship games have NA for from.
Appears to be problem parsing school "in" location instead of "from" location

## Ties

game 174 (1984-09-11) and game 5167 (2016-01-18) have 3-way zero tie, no winner
- there should be 4 games like this

game 1776 (2007-03-16) had a three way tie, each 16000
- all three are co-champions

game 5922 (2018-03-01) First regular-play game to end in a Tiebreaker Round,
- whatr_scores(5922) fails with:
#> Error in UseMethod("html_table") : 
#>   no applicable method for 'html_table' applied to an object of class "xml_missing"

game 6378 (2019-07-18) Second regular-play game to end in a Tiebreaker Round.
whatr_scores(6378)
#> Error in UseMethod("html_table") : 
#>   no applicable method for 'html_table' applied to an object of class "xml_missing"

game 6917 (2021-01-22) Brian Chang game 4. Third regular-play game to end in a Tiebreaker Round.
- whatr_scores(6917)
#> Error in UseMethod("html_table") : 
#>   no applicable method for 'html_table' applied to an object of class "xml_missing"

game 7295 (2022-02-23) Fourth regular-play game to end in a Tiebreaker Round
- whatr_scores(7295) fails with:
#> Error in UseMethod("html_table") : 
#>   no applicable method for 'html_table' applied to an object of class "xml_missing"

## Champions return later

Claudia Corriere comes back to game 5167 (2016-01-18) with 2-day winnings
Also played in game 5132 (2015-12-17) and 5133 (2015-12-18)
