# TODO
## 1. Create error handling in GetData and UpdateDB - Add emails for failure to dl redfin data
## 2. Create this into a package

mpls = "https://www.redfin.com/stingray/api/gis-csv?al=1&market=twincities&min_stories=1&num_homes=350&ord=days-on-redfin-asc&page_number=1&region_id=10943&region_type=6&sf=1,2,5,6,7&status=9&uipt=1,4&v=8"

GetHousingData(mpls)

library(dplyr)

data %>%
  group_by(LOCATION) %>%
  summarize(
    AveragePrice = mean(PRICE),
    NumberOfHouses = n()
    ) %>%
  filter(NumberOfHouses > 4) %>%
  arrange(AveragePrice)
