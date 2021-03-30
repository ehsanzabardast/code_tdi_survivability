import pandas as pd
from collections import defaultdict
import re
import numpy as np


'''
he information provided in this script will help you process the data collected for the survival analysis
You will be instructed to change certain variables in this script
'''


def human_time_to_minutes(s):
    if pd.isna(s):
        return 0
    d = {
      'w':      7*24*60,
      'week':   7*24*60,
      'weeks':  7*24*60,
      'd':      24*60,
      'day':    24*60,
      'days':   24*60,
      'h':      60,
      'hr':     60,
      'hour':   60,
      'hours':  60,
    }
    mult_items = defaultdict(lambda: 1).copy()
    mult_items.update(d)

    parts = re.search(r'^(\d+)([^\d]*)',
                      s.lower().replace(' ', ''))
    if parts:
        return int(parts.group(1)) * mult_items[parts.group(2)] + human_time_to_minutes(re.sub(r'^(\d+)([^\d]*)',
                                                                                               '',
                                                                                               s.lower()))
    else:
        return 0


'''
You are required to read the data collected from the previous script here
'''

df_sq_data = pd.read_csv(r'data/EXAMPLE_DATA.csv',
                         index_col=0,
                         parse_dates=['creation_date', 'update_date'])

'''
You are required to provide the gitlog of the repository in here
Refer to the README file for the instructions
'''

df_gitlog_data = pd.read_csv(r'data/gitlog.csv', header=None,
                             parse_dates=[1])

df_sq_data['creation_date_timestamp'] = df_sq_data['creation_date'].apply(lambda x: x.strftime('%s'))
df_sq_data['update_date_timestamp'] = df_sq_data['update_date'].apply(lambda x: x.strftime('%s'))
df_sq_data['survived_days'] = np.ceil(
    (df_sq_data['update_date_timestamp'].astype(int).to_numpy() - df_sq_data['creation_date_timestamp']
     .astype(int).to_numpy())/(24*3600)
)

commits = df_gitlog_data[1]
survived_commits = []
for idx, obj in enumerate(df_sq_data.iterrows()):
    print(idx)
    start = obj[1]['creation_date']
    end = obj[1]['update_date']
    data = commits.between(start, end, inclusive=False)
    survived_commits.append(data.sum())
df_sq_data['survived commits'] = survived_commits

df_sq_data['effort_mins'] = df_sq_data['effort'].apply(human_time_to_minutes)

'''
Save the result of the process in another csv file
'''

df_sq_data.to_csv('data/SURVIVAL_DATA.csv')

