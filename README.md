# Project-using-Pandas-SQL-Power-BI
The project involved cleaning a retail sales dataset using pandas to make it 
analysis-ready. The original dataset had 200 rows and 9 columns, with several 
issues including missing values in Sales, Ad_Spend, Customer_Name,
 Product_Category, and Returns, as well as inconsistent formats in the Quantity
 and Returns columns. During the cleaning process, duplicates were checked 
(none found), missing values were handled by imputing medians, zeros, or
 placeholder text, and date strings were converted into proper datetime format.
 Non-numeric values in the Quantity column were corrected and cast to integers, 
while the Returns column was standardized to consistent "Yes"/"No" values. The
 cleaned dataset maintained the same shape but ensured all data types were 
appropriate and consistent, resulting in a clean and reliable dataset ready for
 analysis or visualization.
