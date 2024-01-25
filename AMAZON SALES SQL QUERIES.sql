A.	Key Performance Indicators


1.	Total Revenue:
select sum(amount) as 'Total Revenue' from Amazon_Sale_Report;
 
2.	Average Order Value:
select sum(amount)/count(distinct(Order_ID)) as 'Average Order Value' from Amazon_Sale_Report;
 
3.	Total Orders:
select count(distinct(Order_ID)) as 'Total Orders' from Amazon_Sale_Report;
 
4.	Total Products Sold:
select sum(qty) as 'Total Products Sold' from Amazon_Sale_Report;
 
5.	Average Quantity Per Order: 
select cast(sum(Qty) as decimal(10,2)) / cast(count(distinct Order_ID)as decimal(10,2)) as 'Average Order Value' from Amazon_Sale_Report;

 

B.	Daily Trend for Total Orders:

select datename(DW,Date) as 'Order Day', count(distinct order_id) as 'Total Orders' from Amazon_Sale_Report group by datename(DW,Date) order by 'Total Orders'desc

C.	Monthly Trend for Orders:

select datename(Month,Date) as Month,count(distinct order_id) as 'Total Orders' from Amazon_Sale_Report group by datename(Month,Date) order by 'Total Orders'desc;
 
D.	Percentage Sales by Size:

select Size,cast(sum(amount) as decimal(15,3))as Total_sales,cast(sum(amount)*100.0/(select sum(amount) from Amazon_Sale_Report)as decimal(15,3))as Percentage_of_Sales from Amazon_Sale_Report group by Size order by Percentage_of_Sales desc;

E.	Percentage Sales by Category:

select category, round(sum(amount), 2) as total_sales, round(sum(amount) * 100.0 / (select sum(amount) from amazon_sale_report),5) as percentage_of_sales from amazon_sale_report group by category;


