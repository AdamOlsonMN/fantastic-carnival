import pandas as pd
import requests
import io


def GetData(url):
    """
    Attempts to get the content at `url` by making an HTTP GET request.
    """
    session = requests.Session()
    session.headers.update(
        {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.35"
        }
    )

    try:
        session = requests.Session()
        session.headers.update(
            {
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.35"
            }
        )
        r = session.get(url)
        resptext = r.content
        if r.status_code == 200:
            rawData = pd.read_csv(io.StringIO(resptext.decode("utf-8")))
            return rawData
        else:
            print("API Did not get 200 code")
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(e)
    else:
        print("There was another problem.")


def CleanRedfinData(df):
    """
    This function takes the output processed by the GetData function and cleans the column names. It does not currently
    contain error handling.
    """
    df.rename(
        columns={
            "SALE TYPE": "SaleType",
            "SOLD DATE": "SoldDate",
            "PROPERTY TYPE": "PropType",
            "ADDRESS": "Address",
            "CITY": "City",
            "STATE": "State",
            "ZIP": "Zip",
            "PRICE": "Price",
            "BEDS": "Beds",
            "BATHS": "Baths",
            "LOCATION": "Location",
            "SQUARE FEET": "SqFeet",
            "LOT SIZE": "LotSize",
            "YEAR BUILT": " YearBuilt",
            "DAYS ON MARKET": "DaysOnMarket",
            "$/SQUARE FEET": "PricePerSqFoot",
            "HOA/MONTH": "HOAFees",
            "STATUS": "Status",
            "NEXT OPEN HOUSE START TIME": "NextOpenHouseStart",
            "NEXT OPEN HOUSE END TIME": "NextOpenHouseEnd",
            "URL (SEE http://www.redfin.com/buy-a-home/comparative-market-analysis FOR INFO ON PRICING)": "URL",
            "SOURCE": "Source",
            "MLS#": "MLSNumber",
            "FAVORITE": "Favorite",
            "INTERESTED": "Interested",
            "LATITUDE": "Lat",
            "LONGITUDE": "Lon",
        },
        inplace=True,
    )
