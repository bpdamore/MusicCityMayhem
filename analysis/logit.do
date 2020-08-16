import delimited /Users/aq/Documents/Homework/MusicCityMayhem/data/Accidents_2015-2019.csv
tabulate zip year
tabulate precinct year, col
tabulate precinct illumination , col
tabulate hitandrun illumination , col
gen injuries_cat = 0
replace injuries_cat = 1 if numberofinjuries >=1
tab injuries_cat 
gen fatalities_cat = 0
replace injuries_cat = 1 if numberofinjuries >=1
replace fatalities_cat = 1 if numberoffatalities  >=1
tab fatalities_cat 
table precinct, contents(mean numberofmotorvehicles) 
table precinct, contents(mean numberoffatalities) 
table precinct, contents(mean numberofinjuries) 
tabulate collisiontypedescription numberofinjuries 
tabulate collisiontype collisiontypedescription
tab weather weatherdescription
gen weather_cat = 0
replace weather_cat = 1 if weather == 21 | weather == 98
replace weather_cat = 2 if weather == 22 | weather == 2 | weather == 4 | weather == 5 | weather == 3 | weather == 28 | weather == 10 | weather == 8 | weather == 30 
tab weather_cat
tab weather_cat weather
drop if weather == 99
tab weather_cat
tab weatherdescription  if weather_cat ==0
drop if weather_cat == 0
tab weather_cat 
tab injuries_cat weather_cat 
tab injuries_cat weather_cat, col
table injuries_cat weather_cat, col
anova injuries_cat weather_cat
tab illumination 
gen light_cat =0
replace light_cat = 1 if illumination == 1
replace light_cat = 2 if illumination == 2 | illumination == 3 | illumination ==4 | illumination ==5 | illumination == 7 
tab light_cat 
tab illumination light_cat if light_cat == 0
drop if light_cat ==0
tab light_cat 

///important findings
regress numberofinjuries numberoffatalities
regress numberofinjuries numberofmotorvehicles 
regress numberoffatalities numberofmotorvehicles 
logit injuries_cat light_cat
logit fatalities_cat light_cat
anova weather_cat light_cat
anova weather_cat fatalities_cat

des dateandtime
list dateandtime in 1/10 
split dateandtime, p(" ")

summ dateandtime
drop dateandtime

list dateandtime1 in 1/10
list dateandtime2 in 1/10
list dateandtime3 in 1/10

codebook dateandtime3


split dateandtime1, p("/")
rename dateandtime11 month
rename dateandtime12 day
rename dateandtime13 year2
gen month_num = real(month)
tab month_num 
gen day_num = real(day)
tab day_num 
scatter day_num injuries_cat 
scatter month_num injuries_cat 
hist month_num 
hist day_num 
logit injuries_cat day_num 
logit injuries_cat month_num 
logit injuries_cat weather_cat light_cat
gen season = 0
replace season = 1 if month_num  >=3 & month_num  <=5
replace season = 2 if month_num  >=6 & month_num  <=8
replace season = 3 if month_num  >=9 & month_num  <=11
tab season
tab month_num if month_num  >=12 & month_num  <= 2
tab month_num
replace season = 4 if month_num  ==12 | month_num == 1 | month_num ==2
tab season
hist season
set more off

list dateandtime2 in 1/10
split dateandtime2, p(":")
rename dateandtime21 hour
rename dateandtime22 minute
gen hour_num = real(hour)
tab hour_num 
gen min_num = real(minute)
tab min_num 
replace hour_num = hour_num + 12 if dateandtime3 == "PM"
tabulate hour_num 
tabulate season
gen rushHour = 0
replace rushHour = 1 if hour_num == 7 | hour_num == 8 | hour_num == 15| hour_num == 16 | hour_num == 17
tab rushHour 
tabulate rushHour injuries_cat, col
anova rushHour injuries_cat
logit injuries_cat rushHour 
tab season
tabulate season injuries_cat
anova rushHour fatalities_cat
tab injuries_cat
regress numberoffatalities rushHour
regress numberofinjuries rushHour
regress numberofinjuries min_num 
regress numberofinjuries hour_num 
tabulate hour_num if injuries_cat == 1

tabulate numberofinjuries if numberofmotorvehicles >=1
tabulate numberofmotorvehicles  if numberofinjuries >=1
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofmotorvehicles ==12
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofmotorvehicles >=8
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofinjuries >=2
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofinjuries >=5
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofinjuries >=6
tab numberofinjuries 
list numberofmotorvehicles numberoffatalities numberofinjuries if numberofinjuries >=10
gen cars_cat = 0
tab numberofmotorvehicles 
replace cars_cat = 1 if numberofmotorvehicles ==2 
tab cars_cat 
tab injuries_cat cars_cat, col
anova injuries_cat cars_cat 

cd "/Users/aq/Documents/Homework/FinalProject"
export excel using "trafficdata.aq.8.9.2020.csv", firstrow(variables)
