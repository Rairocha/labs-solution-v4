import pandas as pd
from cleaning_functions import remove_plural

def clean_columns_name(df):
    df.columns = df.columns.str.lower().str.replace(' ','_')
    df.columns.values[1] = 'state'
    return df

def clean_invalid_values(df):
    dict_gender = {'Femal':'F', 'Male':'M', 'female':'F','F':'F','M':'M'}
    df['gender'].map(dict_gender,na_action='ignore').value_counts()
    state_abbrevitaion = pd.read_html('https://en.wikipedia.org/wiki/List_of_U.S._state_and_territory_abbreviations')[0].iloc[11:62,[0,3]]
    state_abbrevitaion.columns = ['State','Abbr']
    state_cleaning_dict = state_abbrevitaion.set_index('Abbr').to_dict()['State']
    df['state'] = df['state'].replace(state_cleaning_dict).replace('Cali','California')
    
    df['education'] = df['education'].apply(remove_plural)
    try:
        df['customer_lifetime_value'] = df['customer_lifetime_value'].str.replace('%','').astype(float)
    except:
        pass
    df.rename(columns = {'customer_lifetime_value':'customer_lifetime_value_%'},inplace=True)
    df['vehicle_class'] = df['vehicle_class'].replace({'Luxury SUV':'Luxury','Luxury Car':'Luxury'})
    try:
        df['number_of_open_complaints'] = df['number_of_open_complaints'].str.split('/').str[1].fillna(0).astype(int)
    except:
        pass
    
    df = df.drop_duplicates()
    return df
    
def whole_pipeline(df):
    df = clean_columns_name(df)
    df = clean_invalid_values(df)
    return df
    