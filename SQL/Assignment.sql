/* Task 2:- Basic & Advanced Analysis 
1.	Write a query to display the Customer_Name and Customer Segment using alias name “Customer Name", "Customer Segment" from table Cust_dimen.  
Answer:*/

SELECT Customer_Name as `Customer name`, Customer_Segment as `Customer Segment` from cust_dimen 


/*2.	Write a query to find all the details of the customer from the table cust_dimen order by desc. 
Answer:*/
SELECT * from cust_dimen ORDER BY Customer_Name DESC
 

/*3.	Write a query to get the Order ID, Order date from table orders_dimen where 
‘Order Priority’ is high. 
Anwser:*/
SELECT Order_ID , Order_Date from orders_dimen where Order_Priority = 'HIGH'
 

/*4.	Find the total and the average sales (display total_sales and avg_sales)   
Answer:*/
select avg(sales) as AVG_sales,Sum(Sales) as Total_sales from market_fact
 

/*5.	Write a query to get the maximum and minimum sales from maket_fact table. 
Answer:*/
select min(sales) as MIn_sales,max(Sales) as Max_sales from market_fact
 

/*6.	Display the number of customers in each region in decreasing order of no_of_customers. The result should contain columns Region, no_of_customers. 
Answer: */
SELECT Region,count(Customer_Name) as no_of_cutomer from  cust_dimen GROUP by 1 ORDER by 2 DESC 



/*7.	Find the region having maximum customers (display the region name and max(no_of_customers) 
Anwser:*/
SELECT Region,count(Customer_Name) as no_of_cutomer from  cust_dimen GROUP by 1 ORDER by 2 DESC LIMIT 1

 

/*8.	Find all the customers from Atlantic region who have ever purchased ‘TABLES’ and the number of tables purchased (display the customer name, no_of_tables purchased)   
Answer:*/
 SELECT  c.Customer_Name,count(p.Product_sub_category) as no_of_purchase
 FROM cust_dimen c 
 JOIN market_fact m ON c.Cust_id = m.Cust_id 
 JOIN prod_dimen p ON p.Prod_id = m.Prod_id
 WHERE p.Product_Sub_Category='TABLES' and c.Region='ATLANTIC'
 GROUP by p.Product_Sub_Category,c.Customer_Name
 ORDER BY c.Customer_Name


/*9.	Find all the customers from Ontario province who own Small Business. (display the customer name, no of small business owners) 
Answer:  */
SELECT  c.Customer_Name,count(c.Customer_Segment) as                  no_of_small_business_owner
      	FROM cust_dimen c 
WHERE c.Customer_Segment='SMALL BUSINESS' and c.Province='ONTARIO'
      	GROUP by c.Customer_Name
      	ORDER BY 2
 



/*10.	Find the number and id of products sold in decreasing order of products sold 
(display product id, no_of_products sold)    
Answer: */
SELECT  p.Prod_id,count(p.Prod_id) as no_of_product_Sold
 FROM prod_dimen p
 JOIN market_fact m ON m.Prod_id = p.Prod_id 
 JOIN shipping_dimen s ON s.Ship_id = m.Ship_id
 GROUP by p.Prod_id
 order by 2 DESC 

/*11.	Display product Id and product sub category whose produt category belongs to Furniture and Technlogy. The result should contain columns product id, product sub category. 
Answer:*/
      SELECT  p.Product_Category , Product_Sub_Category from
      prod_dimen p
      where p.Product_Category = 'TECHNOLOGY' OR
      p.Product_Category='FURNITURE'
GROUP by p.Product_sub_Category
 

/*12.	Display the product categories in descending order of profits (display the product category wise profits i.e. product_category, profits)? 
Answer:*/
SELECT  p.Product_Category ,m.Profit 
from prod_dimen p
JOIN market_fact m ON m.Prod_id = p.Prod_id
GROUP by p.Product_Category
ORDER by p.Product_Category DESC
 



/*13.	Display the product category, product sub-category and the profit within each subcategory in three columns.  
Answer:*/
SELECT  p.Product_Category,p.Product_Sub_Category ,m.Profit 
from prod_dimen p
JOIN market_fact m ON m.Prod_id = p.Prod_id
GROUP by p.Product_Category,p.Product_Sub_Category
ORDER by p.Product_Category DESC 
 

/*14.	Display the order date, order quantity and the sales for the order. 
Answer:*/
SELECT  o.Order_Date,m.Order_Quantity ,m.Sales 
from orders_dimen o
JOIN market_fact m ON m.Ord_id = o.Ord_id
GROUP by  o.Order_Date,m.Order_Quantity ,m.Sales 


/*15. Display the names of the customers whose name contains the  
       i) Second letter as ‘R’  Answer:*/
	   SELECT Customer_Name from cust_dimen where Customer_Name like'_R%'


 /* ii) Fourth letter as ‘D’ 
Answer:*/
SELECT Customer_Name from cust_dimen where Customer_Name like '___D%'
 

/*16.	Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and their region where sales are between 1000 and 5000. 
Answer:
*/
SELECT c.Cust_id,c.Customer_Name,c.Region,m.Sales
from cust_dimen c
JOIN market_fact m ON m.Cust_id = c.Cust_id
where m.Sales BETWEEN 1000 and 5000


/*17.	Write a SQL query to find the 3rd highest sales. 
Answer:
*/
SELECT Sales from market_fact
ORDER by Sales DESC LIMIT 2,1
 

/*18.	Where is the least profitable product subcategory shipped the most? For the least profitable product sub-category, display the  region-wise no_of_shipments and the  profit made in each region in decreasing order of profits (i.e. region, no_of_shipments, profit_in_each_region) 
   → Note: You can hardcode the name of the least profitable product subcategory 
Answer:
*/
SELECT  m.Profit, m.Sales , c.Region
from cust_dimen c
JOIN market_fact m ON m.Cust_id = c.Cust_id
JOIN shipping_dimen s ON s.Ship_id = m.Ship_id
JOIN prod_dimen p ON m.Prod_id = p.Prod_id
where p.Product_Sub_category ='OFFICE MACHINES'
GROUP by m.Ship_id,3
order by c.Region,m.Profit DESC
 
