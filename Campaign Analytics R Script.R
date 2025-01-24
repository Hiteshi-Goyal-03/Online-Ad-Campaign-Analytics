# Question 1: Was the advertising campaign effective? Did additional consumers convert as a result of the ad campaign?
  
# 1. Calculate conversion rates for control group (test == 0) and exposed group (test == 1)

# For control group
control_conversion_rate <- mean(data$converted[data$test == 0])

# For exposed group
exposed_conversion_rate <- mean(data$converted[data$test == 1])

# Print the conversion rates
cat("Control Group Conversion Rate: ", control_conversion_rate, "\n")
cat("Exposed Group Conversion Rate: ", exposed_conversion_rate, "\n")

# 2. Compare the conversion rates
if (exposed_conversion_rate > control_conversion_rate) {
  cat("The advertising campaign was effective. Additional consumers converted as a result of the ad campaign.\n")
} else {
  cat("The advertising campaign was not effective. No significant additional consumers converted.\n")
}


# 1. Calculate the conversion rates
control_conversion_rate <- mean(data$converted[data$test == 0])
exposed_conversion_rate <- mean(data$converted[data$test == 1])

# 2. Calculate the total number of users in the exposed group
total_exposed_users <- sum(data$test == 1)

# 3. Calculate the expected conversions if the exposed group had the same conversion rate as the control group
expected_conversions_if_no_ad <- total_exposed_users * control_conversion_rate

# 4. Calculate the actual conversions in the exposed group
actual_conversions_exposed <- sum(data$converted[data$test == 1])

# 5. Calculate the additional consumers converted due to the ad campaign
additional_conversions <- actual_conversions_exposed - expected_conversions_if_no_ad

# Print the results
cat("Control Group Conversion Rate: ", control_conversion_rate, "\n")
cat("Exposed Group Conversion Rate: ", exposed_conversion_rate, "\n")
cat("Actual Conversions in Exposed Group: ", actual_conversions_exposed, "\n")
cat("Expected Conversions in Exposed Group (if no ad): ", expected_conversions_if_no_ad, "\n")
cat("Additional Conversions due to Ad Campaign: ", additional_conversions, "\n")



# 1. Calculate the number of conversions for each group

# For control group (test == 0)
control_conversions <- sum(data$converted[data$test == 0])

# For exposed group (test == 1)
exposed_conversions <- sum(data$converted[data$test == 1])

# 2. Create a bar plot for comparison
absolute_conversions <- c(control_conversions, exposed_conversions)
group_labels <- c("Control Group", "Exposed Group")

# Create the bar plot
barplot(absolute_conversions, names = c("Control Group", "Exposed Group"), col = c("blue", "red"),
        main = "Absolute Conversions: Control vs Exposed Group",
        ylab = "Number of Conversions")

barplot(absolute_conversions, names.arg = group_labels, col = c("blue", "red"),
        main = "Absolute Conversions: Control vs Exposed Group",
        ylab = "Number of Conversions", ylim = c(0, max(absolute_conversions) * 1.2))

# Add labels to the bars
text(x = c(1, 2), y = absolute_conversions, label = absolute_conversions, pos = 3, cex = 0.8)


# Question 2: Was the campaign profitable?

# b. What was the cost of the campaign?

  
#Given in Case
total_impressions <- 14500000  # 14.5 million impressions
CPM <- 9  # Cost per thousand impressions

# Total Cost of the Campaign
total_cost <- (total_impressions / 1000) * CPM

# Print the total cost
total_cost


# Calculate conversion rates for the control and test (exposed) groups
conversion_rates <- aggregate(data$converted ~ data$test, data = data, FUN = mean)

# Print the conversion rates
print(conversion_rates)


# c. Calculate the ROI of the campaign. Was the campaign profitable?

# Total impressions served #14500000 as per case
total_impressions <- sum(data$tot_impr)

# Total conversions #15000 as per case
total_conversions <- sum(data$converted[data$test == 1])


# Revenue per conversion
revenue_per_conversion <- 40  # in dollars

# Total Revenue
total_revenue <- total_conversions * revenue_per_conversion

# Cost per thousand impressions (CPM)
CPM <- 9  # in dollars

# Total Cost
total_cost <- (total_impressions / 1000) * CPM

# Calculate ROI
ROI <- (total_revenue - total_cost) / total_cost

# Print results
cat("Total Revenue: $", total_revenue, "\n")
cat("Total Cost: $", total_cost, "\n")
cat("ROI: ", ROI, "\n")

# Profitability assessment
if (ROI > 0) {
  cat("The campaign was profitable.\n")
} else {
  cat("The campaign was not profitable.\n")
}


# a. How much more money did TaskaBella make by running the campaign (excluding advertising costs)?
  

# Revenue per conversion
revenue_per_conversion <- 40  # in dollars

# Calculate total revenue for exposed group
exposed_revenue <- sum(data$converted[data$test == 1]) * revenue_per_conversion

# Calculate total revenue for control group
control_revenue <- sum(data$converted[data$test == 0]) * revenue_per_conversion

# Calculate the additional revenue generated by running the campaign
additional_revenue <- exposed_revenue - control_revenue

# Print the results
cat("Revenue from Exposed Group: $", exposed_revenue, "\n")
cat("Revenue from Control Group: $", control_revenue, "\n")
cat("Additional Revenue from Campaign: $", additional_revenue, "\n")


# d. What was the opportunity cost of including a control group; how much more could have TaskaBella made with a smaller control group or not having a control group at all?
  

# Given data
total_users <- 590000             # Total targeted users
control_group_percentage <- 0.04   # Control group size (4%)
revenue_per_conversion <- 40       # Revenue per conversion in dollars

# Calculate Control Group Size
control_group_size <- total_users * control_group_percentage

# Actual conversions from control group
actual_conversions_control <- mean(data$converted[data$test == 0])

# Calculate Conversion Rate for the Exposed Group
conversion_rate_exposed <- mean(data$converted[data$test == 1])


# Calculate Potential Conversions from the Control Group
potential_conversions_control_group <- control_group_size * conversion_rate_exposed

# Calculate Potential Revenue from the Control Group
potential_revenue_control_group <- potential_conversions_control_group * revenue_per_conversion

# Calculate Actual Revenue from the Control Group
actual_revenue_control_group <- actual_conversions_control * revenue_per_conversion

# Calculate Opportunity Cost
opportunity_cost <- potential_revenue_control_group -actual_revenue_control_group

# Print Results
cat("Control Group Size: ", control_group_size, "\n")
cat("Potential Revenue from Control Group if Exposed: $", potential_revenue_control_group, "\n")
cat("Actual Revenue from Exposed Group: $", actual_revenue_exposed_group, "\n")
cat("Opportunity Cost of Including Control Group: $", opportunity_cost, "\n")


# 3. How did the number of impressions seen by each user influence the effectiveness of advertising?
  
# a. Create a chart of conversion rates as a function of the number of ads displayed to users. Plot conversion rates for those who were in the control group and for those who were exposed to the ad. Group together number of impressions as necessary to obtain a meaningful plot. (Conversion rate means the percentage of unique users who made a purchase.)


# 1. Calculate conversion rates for the control group (test == 0) and exposed group (test == 1)

# For control group (test == 0)
control_data <- data[data$test == 0, ]
control_conversion_rate <- tapply(control_data$converted, control_data$tot_impr, mean)

# For exposed group (test == 1)
exposed_data <- data[data$test == 1, ]
exposed_conversion_rate <- tapply(exposed_data$converted, exposed_data$tot_impr, mean)

# 2. Plot the conversion rates

# Plot for control group (blue line)
plot(control_conversion_rate, type = "o", col = "blue",
     xlab = "Number of Ads Displayed (Impressions)", ylab = "Conversion Rate", 
     ylim = c(0, max(c(control_conversion_rate, exposed_conversion_rate))),
     main = "Conversion Rates vs. Impressions")

# Add the exposed group (red line)
lines(names(exposed_conversion_rate), exposed_conversion_rate, type = "o", col = "red")

# Add a legend
legend("topright", legend = c("Control Group", "Exposed Group"), col = c("blue", "red"), cex=0.5, lty = 1, pch = 1)




# 4. How does consumer response to advertising vary on different days of the week and at different times of the day?
  
# a. Create a chart with the conversion rates for the control group and the exposed group as a function of the day of week when they were shown the most Impressions.


# 1. Group by 'mode_impr_day' and calculate conversion rates for control and exposed groups

# For control group (test == 0)
control_data <- data[data$test == 0, ]
control_conversion_rate <- tapply(control_data$converted, control_data$mode_impr_day, mean)

# For exposed group (test == 1)
exposed_data <- data[data$test == 1, ]
exposed_conversion_rate <- tapply(exposed_data$converted, exposed_data$mode_impr_day, mean)

# 2. Create the plot

# Plot for control group (blue line)
plot(control_conversion_rate, type = "o", col = "blue",
     xlab = "Day of the Week (1=Monday, 7=Sunday)", ylab = "Conversion Rate", 
         main = "Conversion Rates vs. Day of the Week")

# Add the exposed group (red line)
lines(names(exposed_conversion_rate), exposed_conversion_rate, type = "o", col = "red")

# Add a legend
legend("bottomright", legend = c("Control Group", "Exposed Group"), cex=0.5, col = c("blue", "red"), lty = 1, pch = 1)


# b. Create the same chart for hours within a day (excluding the period between midnight and 8 a.m.).


# 1. Filter out users who saw ads between midnight and 8 a.m.
filtered_data <- data[data$mode_impr_hour >= 8, ]

# 2. Group by 'mode_impr_hour' and calculate conversion rates for control and exposed groups

# For control group (test == 0)
control_data_hour <- filtered_data[filtered_data$test == 0, ]
control_conversion_rate_hour <- tapply(control_data_hour$converted, control_data_hour$mode_impr_hour, mean)

# For exposed group (test == 1)
exposed_data_hour <- filtered_data[filtered_data$test == 1, ]
exposed_conversion_rate_hour <- tapply(exposed_data_hour$converted, exposed_data_hour$mode_impr_hour, mean)

# 3. Create the plot

# Plot for control group (blue line)
plot(names(control_conversion_rate_hour), control_conversion_rate_hour, type = "o", col = "blue",
     xlab = "Hour of the Day (8 AM - 11 PM)", ylab = "Conversion Rate", 
     ylim = c(0, max(c(control_conversion_rate_hour, exposed_conversion_rate_hour))),
     main = "Conversion Rates vs. Hour of the Day")


# Add the exposed group (red line)
lines(names(exposed_conversion_rate_hour), exposed_conversion_rate_hour, type = "o", col = "red")

# Add a legend
legend("topright", legend = c("Control Group", "Exposed Group"), cex=0.75, col = c("blue", "red"), lty = 1, pch = 1)


# c. What days/hours is advertising most/least effective?


# Find most effective day and time for adverstising
most_conversion_day <- max(exposed_conversion_rate)
most_conversion_hour <- max(exposed_conversion_rate_hour)

# Find least effective day and time for adverstising
least_conversion_day <- min(exposed_conversion_rate)
least_conversion_hour <- min(exposed_conversion_rate_hour)

# Most conversions for control group
most_conversion_day <- max(control_conversion_rate)
most_conversion_hour <- max(control_conversion_rate_hour)

# Least conversions for control group
least_conversion_day <- min(control_conversion_rate)
least_conversion_hour <- min(control_conversion_rate_hour)