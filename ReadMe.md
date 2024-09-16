## Customer Segmentation and Campaign Strategy Report
## Project Overview
The objective of this project was to segment customers based on their purchasing behavior using RFM (Recency, Frequency, and Monetary) analysis. This segmentation allows for targeted marketing strategies, focusing on improving customer engagement, retention, and overall marketing ROI.

## Data Overview
The dataset, sourced from an online retail store, contains the following key features:

Invoice: A unique identifier for each transaction.<br/>

StockCode: Unique code for each product.<br/>

Description: Name of the product.<br/>

Quantity: Number of units purchased in each transaction.<br/>

InvoiceDate: Date and time of the transaction.<br/>

Price: Unit price of each product.<br/>

Customer ID: Unique identifier for each customer.<br/>

Country: The country in which the customer is located.<br/>

## Data Preparation<br/>

Data preparation involved the following steps:

Cleaning: Rows with missing Customer ID values were removed to ensure every transaction was linked to a customer.<br/>

Data Formatting: Converted InvoiceDate to a date format for calculating the recency of each transaction.<br/>

Handling Negative Quantities: Rows with negative quantities (returns or errors) were removed to ensure accurate analysis.<br/>

Total Amount Calculation: A new column TotalAmount was created to represent the monetary value of each transaction (Quantity * Price).<br/>

## RFM Metric Calculation

We calculated three essential RFM metrics for each customer:<br/>

Recency (R): The number of days since the customer's last transaction, indicating how recently a customer has interacted.<br/>

Frequency (F): The number of unique transactions made by the customer, reflecting their loyalty.<br/>

Monetary (M): The total amount spent by the customer, representing their overall value to the business.<br/>

A reference date (one day after the last transaction in the dataset) was used to compute the recency for each customer.<br/>

## Summary Statistics of RFM Metrics:

Recency ranged from a few days to several hundred days, indicating varying levels of customer engagement.<br/>

Frequency distribution revealed a mix of one-time purchasers and repeat customers.<br/>

Monetary values showed that some customers have contributed significantly to revenue, while others have made smaller purchases.<br/>
## Customer Segmentation Using RFM Scoring<br/>
To segment customers:

Quartile Scoring: We divided each RFM metric into quartiles (1 to 4). Higher scores indicate better customer performance (e.g., more recent, frequent, or higher spending).<br/>

Combined RFM Score: Each customer received a combined RFM score, calculated as:<br/>

RFM_Score = R_Score * 100 + F_Score * 10 + M_Score<br/>

This resulted in segments ranging from 111 (low R, F, and M scores) to 444 (high R, F, and M scores).<br/>

## RFM Segmentation and Insights<br/>
After scoring, we categorized customers into various segments:<br/>

Champions (RFM = 444): Recent purchasers, frequent buyers, and high spenders. These are the store’s most valuable customers.<br/>

Loyal Customers: Customers with high frequency and monetary scores, indicating consistent spending.<br/>

Potential Loyalists: Customers with high recency and moderate frequency, suggesting they may become loyal over time.<br/>

At-Risk Customers: Customers with low recency but high monetary and frequency scores, indicating they were once valuable but may be losing interest.<br/>

## Visualization Highlights:

![Rplot03](https://github.com/user-attachments/assets/747f3123-d833-487e-a90a-6434df0b83f1)
Recency Distribution: Shows the diversity in customer engagement, with some customers purchasing recently and others having longer gaps.<br/>

![Rplot04](https://github.com/user-attachments/assets/1ddfabc2-2709-4b07-8a3f-c66b68c2d502)
Frequency Distribution: Reveals that while some customers shop frequently, a large portion consists of one-time purchasers.<br/>

![Rplot05](https://github.com/user-attachments/assets/c70168cf-a874-4126-b14d-b41e3ad278b8)
Monetary Distribution: Highlights high-value customers who significantly impact the store's revenue.<br/>

## Marketing Strategy Recommendations<br/>
Based on the segmentation, we recommend the following strategies for targeted marketing:<br/>

Champions (RFM = 444): Offer loyalty rewards, early access to new products, and exclusive deals to maintain their engagement.<br/>

Potential Loyalists: Engage with special promotions or personalized recommendations to encourage repeat purchases and convert them into loyal customers.<br/>

At-Risk Customers: Launch win-back campaigns (e.g., special discounts, reminders) to re-engage them.<br/>

Low-Value Customers: Experiment with targeted promotions to increase their purchase frequency or spend.<br/>

## Limitations<br/>
Data Quality: The analysis assumes that the transaction data accurately represents customer behavior. Any errors in recording transactions (e.g., missing Customer IDs, incorrect quantities) could affect the segmentation results.<br/>

Static Analysis: RFM analysis provides a snapshot based on historical data but does not predict future customer behavior. It’s advisable to regularly update the segmentation with new data to capture changing customer patterns.<br/>

Simple Segmentation: While RFM is effective, it doesn't account for other aspects such as product preferences, engagement with marketing campaigns, or customer lifecycle stages. A more holistic segmentation might include additional behavioral and demographic data.<br/>

 ## Future Work<br/>
Dynamic RFM Segmentation: Update the RFM scores periodically (e.g., monthly) to capture changes in customer behavior over time.<br/>

Incorporate Additional Features: Include demographic data (age, location) and product preferences to refine the segmentation further.<br/>

A/B Testing on Campaigns: Implement targeted marketing campaigns for different segments and use A/B testing to measure the effectiveness of strategies.<br/>

Predictive Analytics: Use machine learning models to predict customer churn, lifetime value, and the likelihood of moving between segments.<br/>

## Conclusion<br/>
RFM analysis provided a valuable framework for segmenting customers based on their purchasing behavior. By identifying high-value and at-risk customers, the business can tailor its marketing strategies to maximize customer retention, loyalty, and revenue growth. This approach is simple, interpretable, and serves as a solid foundation for more advanced customer analytics in the future.

