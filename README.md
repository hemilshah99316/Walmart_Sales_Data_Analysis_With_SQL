
# 🛒✨ Walmart Sales Data Analysis Using SQL

Welcome to the **Walmart Sales Data Analysis** project, where we explore and gain insights from Walmart's sales data using **Microsoft SQL Server**. The dataset is an Excel file that captures various transactional details, including customer behavior, product performance, and more.

## 📄 Data Summary

The Walmart sales dataset provides detailed information about sales transactions across various branches, cities, and customer demographics. Here’s an overview of the data:

### 📋 **Data Columns and Types**

| Column Name               | Data Type        | Description                                      |
|---------------------------|------------------|--------------------------------------------------|
| `Invoice ID`               | `varchar(50)`    | Unique identifier for each transaction            |
| `Branch`                   | `varchar(10)`    | Store branch (A, B, or C)                         |
| `City`                     | `varchar(50)`    | City where the transaction took place             |
| `Customer type`            | `varchar(20)`    | Type of customer (e.g., Member, Normal)           |
| `Gender`                   | `varchar(10)`    | Gender of the customer                            |
| `Product line`             | `varchar(50)`    | Category of products purchased                    |
| `Unit price`               | `decimal(10,2)`  | Price per unit of the product                     |
| `Quantity`                 | `int`            | Number of units purchased                         |
| `Tax 5%`                   | `decimal(10,2)`  | 5% tax applied to the total purchase              |
| `Total`                    | `decimal(10,2)`  | Total amount paid (including tax)                 |
| `Date`                     | `date`           | Date of the transaction                           |
| `Time`                     | `time`           | Time of the transaction                           |
| `Payment`                  | `varchar(20)`    | Payment method used (e.g., Cash, Ewallet)         |
| `COGS`                     | `decimal(10,2)`  | Cost of goods sold                                |
| `Gross margin percentage`   | `decimal(10,2)`  | Gross margin percentage                           |
| `Gross income`             | `decimal(10,2)`  | Gross income from the transaction                 |
| `Rating`                   | `decimal(3,1)`   | Customer rating of the transaction (1 to 10)      |

## 🛠️ Data Transformation

Several transformations were made on the data to derive meaningful insights:

- **Time of Day**: Transactions were classified into 'Morning', 'Afternoon', 'Evening', and 'Night' based on the transaction time.
- **Day of the Week**: Extracted the day of the week from the date for each transaction.
- **Month**: Transactions were categorized by their respective month for monthly trend analysis.

## 💡 Insights Derived

The project aims to answer key questions to help understand customer behavior, sales trends, and product performance. Here are some of the insights derived:

- 📍 **Branch Insights**:
  - Which branch sold more products than the average?
  - Branch performance comparison across different time periods.

- 🛒 **Product Insights**:
  - What are the best-selling product lines?
  - How do product preferences differ based on gender?

- 👥 **Customer Insights**:
  - Which customer type generates the most revenue?
  - Gender distribution of customers across different branches.

- 🕒 **Time-Based Insights**:
  - What time of day do customers give the highest ratings?
  - Which days of the week generate the most revenue?

## 📈 Visuals & Reporting

Various SQL queries were used to generate insights for reporting purposes. These include breakdowns by city, branch, product lines, and customer demographics.

## 🚀 Getting Started

Follow these steps to set up the project and replicate the analysis:

1. Clone this repository:
   ```bash
   git clone https://github.com/hemilshah99316/Walmart_Sales_Data_Analysis_With_SQL.git
   ```

2. **SQL Server Setup**:
   - Import the Excel file into Microsoft SQL Server.
   - Run the provided SQL scripts to perform data transformations and derive insights.

3. Explore the data and customize queries to gain additional insights.

## 💻 Tools Used

- **Microsoft SQL Server**: For database management and SQL queries.
- **Excel**: Source of the sales data.
- **SQL**: To query and analyze the data.

## 🔑 Key Features

- 🛍 **Product Insights**: Learn which product categories are driving the most revenue.
- 📅 **Time-based Analysis**: Discover how sales performance varies across different times of the day and days of the week.
- 💳 **Customer Behavior**: Understand customer demographics, payment methods, and buying preferences.
- 📊 **Branch Performance**: Compare sales performance across different branches and cities.
