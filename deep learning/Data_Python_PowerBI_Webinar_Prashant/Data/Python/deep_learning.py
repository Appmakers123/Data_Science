# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
# importing
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# basic details

data = pd.read_csv('Restaurant_Details.csv')

data.head()
data.info()
data.columns

data = data.drop(['url', 'address','phone','review_list','menu_item'],axis =1)

data.types
#3 prepare rate
data['rate'] = data['rate'].apply(lambda x:str(x).split('/')[0])

pd.DataFrame(data.isnull().sum(),column = ["Null value - absolute"])

pd.DataFrame(round(data.isnull().sum()/data.shape[0]*100,3),columns = ["Null Value- %"])

# renaming column

# some imp KPIs

len(data['city'].value_counts())