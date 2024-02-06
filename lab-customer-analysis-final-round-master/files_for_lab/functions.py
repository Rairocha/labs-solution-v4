import pandas as pd
def preprocessing(df,encoder):
    """treats all the categorical features"""
    df['day'] = pd.to_datetime(df['effective_to_date']).dt.day
    df['month'] = pd.to_datetime(df['effective_to_date']).dt.month
    df['year'] = pd.to_datetime(df['effective_to_date']).dt.year
    df = df.drop(columns = ['effective_to_date'])
    
    categorical_columns = ['state','coverage','education','employmentstatus','location_code','marital_status','policy_type','policy','renew_offer_type','sales_channel','vehicle_class','vehicle_size','response','gender']
    df_categorical = pd.DataFrame(encoder.transform(df[categorical_columns])
            ,columns=encoder.get_feature_names_out(),index=df.index)
    df = df.drop(columns= categorical_columns)
       
    df = df.drop(columns= ['customer'])
    
    return pd.concat([df,df_categorical],axis=1)


def normalization_step(df,scaler):
    return pd.DataFrame(scaler.transform(df.select_dtypes('number')),columns = df.select_dtypes('number').columns)

def test(X_test,encoder,scaler):
    X_test_no_cat = preprocessing(X_test,encoder)
    X_test_norm =normalization_step(X_test_no_cat,scaler)
    return X_test_norm

