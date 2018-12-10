GetHousingData <-function(url){
  require(dplyr)
  require(httr)
  
  DateForDF = Sys.Date()
  DateForFile = format(Sys.Date(), "%Y%m%d")
  ExcelFileDate <- paste0(DateForFile, "HousingData")
  
  r <- GET(
    url, 
    add_headers(Name = "DomesticLyfe"),
    set_cookies("MeWant" = "cookies")
    )
  
  HousingData <- content(r)
  
  HousingData %>%
    mutate(
      date_collected = DateForDF
    ) -> HousingDataProcessed
  
  write.csv(
    HousingDataProcessed,
    paste0("./output/", ExcelFileDate, ".csv"))
  
  return(HousingDataProcessed)
}

