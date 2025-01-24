# Online-Ad-Campaign-Analytics
This project dives into **marketing analytics metrics,** analyzing the effectiveness of an online advertising campaign **using R.** It leverages advanced analytics and insights to optimize ad performance and drive decision-making. Includes insights on ROI, consumer response, impressions, and conversion rates, visualized for actionable outcomes.

# Description of CSV file data set
Each row in the CSV file data set (rocketfuel_data.csv) represents a uniquely identified user in the ad campaign. For each user, the following six columns are provided.

**_user id:_** Unique identifier of the user

**_test:_** Whether the user was exposed to advertising or was in the control group. 1 if the user was exposed to the real ad, 0 if the user was in the control group and was shown a PSA.

**_converted:_** Whether the user converted. 1 if the user bought the handbag during the campaign, 0 if not.

**_tot_impr:_** The total number of ad impressions the user encountered. For users in the control group, this counts the number of times they encountered the PSA. For exposed users, it counts the number of times they were shown the ad.

**_mode_impr_day:_** Shows the day of the week on which the user encountered the most number of impressions. 1 means Monday, 7 means Sunday. For example, if a given user encountered 2 impressions on Mondays, 3 on Tuesdays, 7 on Wednesdays, 0 on Thursdays and, Fridays, 9 on Saturdays and 2 on Sundays, this column takes the value of 6 (Saturday).

**_mode_impr_hour:_** Shows the hour of the day (0-23) in which the user encountered the most number of impressions.
