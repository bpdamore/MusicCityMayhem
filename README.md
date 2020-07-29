# MusicCityMayhem
![Nashville Traffic](https://i2.wp.com/www.overdriveonline.com/files/2010/10/nashvilleUntitled-1.jpg?resize=480%2C316)
##### img source https://perimeterpark.net/
## Dataset

This dataset is compiled from the Metro Nashville Data website. Below you will find links to the datasets.

* [2015 Traffic Data](https://data.nashville.gov/Police/Traffic-Accidents-2015-/usum-h3s3)
* [2016 Traffic Data](https://data.nashville.gov/Police/Traffic-Accidents-2016-/p8j3-w8wi)
* [2017 Traffic Data](https://data.nashville.gov/Police/Traffic-Accidents-2017-/v6ss-vxgd)
* [2018 Traffic Data](https://data.nashville.gov/Police/Traffic-Accidents-2018-/8kay-6qhc)
* [2019 Traffic Data](https://data.nashville.gov/Police/Traffic-Accidents-2019-/abyc-w6mc)

---

## Processing
Using Pandas we read in the individual csv files and found discrepancies in column names. We renamed the columns that didn't match, added a Year column for easy sorting, and merged the datasets into a single [csv](data/Accidents_2015-2019) that can be found in the "data" folder. 

------

## Goal Ideas
* Predicting accidents based on a zip code's median income
* Predicting fatalities based on population increase
* Predicting accidents based on population density
* Construction?
* Highway accidents vs neighborhood accidents vs city accidents
* Predicting likelihood of crash depending on time of day
* 


