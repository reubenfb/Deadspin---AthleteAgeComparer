 a gap in my documentation between the .csv files that the R scrapers spit out, and the .csv files that are fed into the Javascript code. The R scraper returns a .csv file like mlb_example.csv, included in this folder. I did the next three steps in Excel, but they could easily be added to the R scraper code itself:

1. I merged/reformatted the "dates" column, which is month.day.., and the "year" column into a "mm/dd/yyyy" format.
2. I calculated the number of days between each date and 1/1/2050 (arbitrarily chosen).
3. I reformatted the document into a single column of these "number of days" values--each five digits long. This column, with a header "day" is the csv formatting that's fed into the Javascript code.
\
Very sorry for the omission.

-Reuben
