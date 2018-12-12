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


mpls = "https://www.redfin.com/stingray/api/gis-csv?al=1&market=twincities&min_stories=1&num_homes=350&ord=days-on-redfin-asc&page_number=1&region_id=10943&region_type=6&sf=1,2,5,6,7&status=9&uipt=1,4&v=8"


GetData(mpls)