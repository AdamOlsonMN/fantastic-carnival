GetHousingData <-function(url){
  require(dplyr)
  require(httr)
  
  DateForDF = Sys.Date()
  DateForFile = format(Sys.Date(), "%Y%m%d")
  ExcelFileDate <- paste0(DateForFile, "HousingData")
  
  r <- GET(
    mpls,
    user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.35"),
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


data<-GetHousingData()