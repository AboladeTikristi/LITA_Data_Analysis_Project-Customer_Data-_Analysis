# LITA_Data_Analysis_Project-Customer_Data-_Analysis

## Outline Guide

[Project Overview](#project-overview)

[Data Sources](#data-sources)

[Tools Used](#tools-used)

[Data Cleaning and Preparation](#data-cleaning-and-preparation)

[Exploratoration of Sales Data Table](#exploratoration-of-sales-data-table)

[Data Analysis](#data-analysis)

[Data Visualization](#data-visualization)

[Drawing Inference](#drawing-inference)

[Data Conclusion and Proposals](#data-conclusion-and-proposals)

### Project Overview
---
This project involves analyzing customer data for a subscription service to identify segments and trends. The is to understand customer behavior, track subscription types, and identify key trends in cancellations. It involves the use of pivot tables and excel formulas in Microsoft excel, the use of queries in sql (Structured Query Language) and the use of measures, cardsm barchartsm pie charts and other visuals for Data Analysis Visualisation.

### Data Sources
---
The Incubator Hub provided the Primary Source of this data and can be gotten [here](https://docs.google.com/spreadsheets/d/1urd2IUb7pRdGq8uHZ1njgDbtaCh4GCwF/edit?usp=drive_link&ouid=114961730859133220198&rtpof=true&sd=true)

### Tools Used
---
- Microsoft Excel [Download here](https://www.microsoft.com/en/microsoft-365/microsoft-office)

	1. For Data Cleaning
	2. For Analysis
	3. For Visualization

- SQL- Structured Query Language for Querying of Data,
  mainly SSMS (SQL Server Management System) [Download here](https://aka.ms/ssmsfullsetup)
  and SQL Server [Download here](https://www.microsoft.com/sql-server/sql-server-downloads)
  
- Microsoft PowerBi for Analysis Visualization [Download here](https://www.microsoft.com/en-us/download/details.aspx?id=58494)
- GitHub for Portfolio Building


  ### Data Cleaning and Preparation
---
In the initial phase of the Data Cleaning and Preparation

1. Data loading and Inspection
2. Checking for missing variables
3. Confirmation of Data Types.

### Exploratoration of Sales Data Table
---
The Columns in this Table includes the:
-CustomerID
-CustomerName
-Region
-SubscriptionType
-SubscriptionStart
-SubscriptionEnd	Canceled
-Revenue	Subscription Duration

  
Here are some of the questions to answered in this Analysis:

1. Total number of Customers.
2. Most Popular subscription among Customers
3. Average Subscription duration
4. Total revenue per year, per region, and subscription type.
5. Total Number of active and canceled subscriptions and Revenue generated from each.
6. 

### Data Analysis
---

1. To find out the Total Revenue by Subscription types,region, and year, Pivot tables were used in Excel and SQL queries.

    -Total Revenue by Year
   
    |	Years|	Total Revenue|
    |------|---------------|
    |2023|89,902,969.00|
    |2024|59,916,717.00|

  - Total Revenue per subscription type
    This can be found with either the use of SQL query or pivot table in Excel.
    
	          ```Select                                                                                                              
	      SubscriptionType, 
	      SUM(Revenue)
	      as 'Total Revenue' 
	      from Customer_Data
	      Group by SubscriptionType
	      Order by [Total Revenue] desc```

 - Total Revenue per region
   
    ![customer+revenue by region](https://github.com/user-attachments/assets/79691b0b-f242-4ae6-95b4-ece07bf4ee1c)

2. Most Popular Subscription among Customers

		   ``` Select
		SubscriptionType, 
		APPROX_COUNT_DISTINCT(CustomerID) 
		as 'No of Customers' 
		from Customer_Data
		Group by SubscriptionType
		Order by [No of Customers]desc```
   
3. Averge Subscription Duration
   To find this :
   - First, subtract the subscription end from the subscriptionstart then divide by 365 and make it to zero decimal places.
   - Second, use the AVERAGE() function to get the average duration.
     
       ``` =AVERAGE(CustomerData!I2:I75001) ```

     ![Avg_sub_duration](https://github.com/user-attachments/assets/d62224bc-05a3-4f9f-9012-0b6447b26943)

4. Total Number of active and canceled subscriptions and Revenue generated from each

		   	```Select 
		COUNT(Canceled)-SUM(Convert(int,Canceled,1)) 
		as ActiveSubscription,
		SUM(Convert(int,Canceled,1)) 
		as CanceledSubscription ,
		COUNT(Canceled) 
		as TotalSubscription
		from Customer_Data```


### Data Visualization
---

Measures Created in Powerbi are:

1. Percentage Canceled Subscription
 2. Averge SubscriptionDuration
  3. Successful Subscription
   4. Total Subscription

#### There are a few Visualizations in the Excel file but will be showing visualization using Ms PowerBi

  1. Key Customer information report
     This shows the total number of customer, customer of the year, the revenue generated per customer, the customes in each region and the number of customer that cancelled subscription.
     
 ![customerSegmentationReport](https://github.com/user-attachments/assets/2da1079d-3d8c-46c9-a428-5cebe58ea2e7)

  3. Customer Subscription Trends Report
	This shows the subscription trend down the month and the sum of revenue ctgorized by subscription type.

     	![Customer Subscription Trends](https://github.com/user-attachments/assets/c30478f0-f35a-4b97-abc6-240c48684ffa)

  4. Customer Subscription Cancelation Report
     This shows Total Number of subscrptions, the cancelation and the revenue generated by both active and cancelled subscriptions using slicer.

     ![SubscriptionCancellation report](https://github.com/user-attachments/assets/92d85228-2fb0-4298-93b9-9e5b8212b272)


 ### Drawing Inference
 ---

 From the exploratory result and visualization, the inferences drawn are:
 
 1. From the Key Customer information Report,the Customer cancellation rate is at the low side.
 2. The total revenue of those that canceled is higher than those that didn't.
 3. The table has equal customer count in each region.
 4. The Basic Subcription type is the most used generally by customers in the east and north.
 5. The Average subscription duration is one year.
 6. No one in the east cancelled their subscription.
 7. The customersof the year in both year are from the south region

### Data Conclusion and Proposals
---
In conclusion, The company is loosing money and customers.

Hence, some Proposals are:

1. The company needs to focus on reducing cancelation rate and also increase of subscription as the year goes by.
2. The Company shoul also foocus on increasing subscription sales in the east where there are ni cancellations
