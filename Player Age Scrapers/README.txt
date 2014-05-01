{\rtf1\ansi\ansicpg1252\cocoartf1038\cocoasubrtf360
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww9000\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\ql\qnatural\pardirnatural

\f0\fs24 \cf0 5/1/2014\
\
There's a gap in my documentation between the .csv files that the R scrapers spit out, and the .csv files that are fed into the Javascript code. The R scraper returns a .csv file like mlb_example.csv, included in this folder. I did the next three steps in Excel, but they could easily be added to the R scraper code itself:\
\
1. I merged/reformatted the "dates" column, which is month.day.., and the "year" column into a "mm/dd/yyyy" format.\
2. I calculated the number of days between each date and 1/1/2050 (arbitrarily chosen).\
3. I reformatted the document into a single column of these "number of days" values \'96each five digits long. This column, with a header "day" is the csv formatting that's fed into the Javascript code.\
\
Very sorry for the omission.\
\
-Reuben}