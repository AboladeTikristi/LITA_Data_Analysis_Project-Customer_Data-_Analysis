select * from Customer_Data

Alter Table Customer_Data
Drop Column [Column9]

--- Retrieve the total number of customer from each region'

Select Region,
APPROX_COUNT_DISTINCT(CustomerID) 
as 'No of Customers' 
from Customer_Data
Group by Region

--- Find the Most Popular Subscription type by the number of Customers

Select
SubscriptionType, 
APPROX_COUNT_DISTINCT(CustomerID) 
as 'No of Customers' 
from Customer_Data
Group by SubscriptionType
Order by [No of Customers]desc

--0Answer: The Most popular Subscription is BASIC type

--- Find Customers who canceled their subscription within six month

 Select 
 CustomerID, 
 CustomerName,
 DATEDIFF(month,SubscriptionStart,SubscriptionEnd) as
 SubCanceled 
 from 
 Customer_Data
 where 
 DATEDIFF(month,SubscriptionStart,SubscriptionEnd) <= 6 and Canceled=1

 ---Answer: None of the Customers Canceled their subscriptions within 6 months.

 ---Calculate the Average Subscription duration for all Customers

 Select 
	APPROX_COUNT_DISTINCT(CustomerID) 
	as 'No of Customers' ,

	CASE
	when AVG(
	 DATEDIFF(YEAR,SubscriptionStart,SubscriptionEnd)
	 ) <= 1
	then CONVERT(varchar,
	AVG(
	 DATEDIFF(YEAR,SubscriptionStart,SubscriptionEnd)
	 ), 50 
	 )  +'Year'
	Else CONVERT(varchar,
	AVG(
	 DATEDIFF(YEAR,SubscriptionStart,SubscriptionEnd)
	 ), 50 
	 ) +'Years'
	END as [Average Subscription Duration]

from 
	[dbo].[Customer_Data]

	--- Find Customers with subscription lesser than 12 months

 Select 
 CustomerID, 
 CustomerName,
 DATEDIFF(month,SubscriptionStart,SubscriptionEnd) as
LessThanAYearSub 
 from 
 Customer_Data
 where 
 DATEDIFF(month,SubscriptionStart,SubscriptionEnd) > 12 

 ---Answer: NoCustomer subscribed longer than 12 months

 --- Calculate Total revenue by Subscription type

Select
SubscriptionType, 
SUM(Revenue)
as 'Total Revenue' 
from Customer_Data
Group by SubscriptionType
Order by [Total Revenue] desc

--- Find top 3 regions by Subscription Cancellaton

Select region, SUM(Convert(int,Canceled,1)) as SubCanceled from Customer_Data
Group by Region
Order by SubCanceled desc

--- The top 3 Regions by Subscription Cancellation are North, South and West.

--- Find the total number of active and canceled Subscriptions

Select 
COUNT(Canceled)-SUM(Convert(int,Canceled,1)) 
as ActiveSubscription,
SUM(Convert(int,Canceled,1)) 
as CanceledSubscription ,
COUNT(Canceled) 
as TotalSubscription
from Customer_Data

--- Active Subscription - 41250
--- CanceledSubscription-   33750
----Total Subscription - 75000

