import joblib
import pandas as pd
import streamlit as st
from functions import test

model = joblib.load('best_model.pkl')
encoder = joblib.load('encoder.pkl')
scaler = joblib.load('scaler.pkl')

customer_code = st.text_input('Write the customer code',"BU79786")

state = st.selectbox(label= 'Customer state',options =['Washington',
                                         'California',
                                         'Oregon',
                                         'Arizona',
                                         'Nevada'],
                        placeholder ='Washington')
lifetime_value = st.number_input('Customer lifetime value',
                                 min_value = 0,
                                 )


if st.button('Predict Total Claim amount'):
    df_deploy = pd.DataFrame({"customer":customer_code,
                          "state":state ,
                          "customer_lifetime_value":lifetime_value,
                          "response":"No",
                          "coverage":"Basic",
                          "education":"Bachelor",
                          "effective_to_date":"2/24/11",
                          "employmentstatus":"Employed",
                          "gender":"F",
                          "income":56274,
                          "location_code":"Suburban",
                          "marital_status":"Married",
                          "monthly_premium_auto":69,
                          "months_since_last_claim":32,
                          "months_since_policy_inception":5,
                          "number_of_open_complaints":0,
                          "number_of_policies":1,
                          "policy_type":"Corporate Auto",
                          "policy":"Corporate L3",
                          "renew_offer_type":"Offer1",
                          "sales_channel":"Agent",
                          "vehicle_class":"Two-Door Car",
                          "vehicle_size":"Medsize",},index=[0])
    prediction = model.predict(test(df_deploy,encoder,scaler))[0]
    st.write('This client will make a Total claim Amount of',prediction)