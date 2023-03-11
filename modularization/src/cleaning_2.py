import pandas as pd 

def rename_and_na (df):
    """Description
    :arguments:
    return
    """
    df = pd.read_csv(df)
    df.columns = [i.capitalize().replace(" ", "-") for i in df.columns]
    df.dropna(inplace=True)
    return df