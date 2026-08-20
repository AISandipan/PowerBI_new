/*========================================================
  ECOMFINANCE - 50 RECORD DATASET
========================================================*/

data EcomFinance;
    infile datalines dlm=',' firstobs=2;
    length Month $8 Region $6;
    input Record Month $ Sales Advertising Expenses Profit Region $;

    /* Create a SAS date for time-series analysis */
    Date = intnx('month','01JAN2022'd,Record-1);
    format Date monyy7.;

datalines;
Record,Month,Sales,Advertising,Expenses,Profit,Region
1,Jan-2022,12500,1800,8500,2200,North
2,Feb-2022,13200,1900,8700,2600,South
3,Mar-2022,14100,2000,9000,3100,East
4,Apr-2022,13800,1950,8900,2950,West
5,May-2022,14900,2100,9400,3400,North
6,Jun-2022,15500,2200,9700,3600,South
7,Jul-2022,16100,2300,9900,3900,East
8,Aug-2022,15800,2250,9800,3750,West
9,Sep-2022,16900,2400,10200,4300,North
10,Oct-2022,17600,2500,10600,4500,South
11,Nov-2022,18500,2700,11100,4700,East
12,Dec-2022,20500,3000,12000,5500,West
13,Jan-2023,19200,2800,11500,4900,North
14,Feb-2023,19800,2850,11700,5250,South
15,Mar-2023,21000,3000,12300,5700,East
16,Apr-2023,21800,3100,12600,6100,West
17,May-2023,22500,3200,13000,6300,North
18,Jun-2023,23200,3300,13300,6600,South
19,Jul-2023,24000,3400,13700,6900,East
20,Aug-2023,23500,3350,13500,6650,West
21,Sep-2023,24800,3500,14000,7300,North
22,Oct-2023,25600,3650,14400,7550,South
23,Nov-2023,27000,3900,15000,8100,East
24,Dec-2023,29500,4300,16400,8800,West
25,Jan-2024,27800,4000,15700,8100,North
26,Feb-2024,28600,4100,16000,8500,South
27,Mar-2024,30000,4250,16600,9150,East
28,Apr-2024,30800,4350,16900,9550,West
29,May-2024,31600,4450,17300,9850,North
30,Jun-2024,32500,4600,17700,10200,South
31,Jul-2024,33400,4700,18100,10600,East
32,Aug-2024,32900,4650,17900,10350,West
33,Sep-2024,34200,4800,18400,11000,North
34,Oct-2024,35100,4950,18800,11350,South
35,Nov-2024,36500,5200,19500,11800,East
36,Dec-2024,39800,5700,21500,12600,West
37,Jan-2025,38000,5400,20500,12100,North
38,Feb-2025,38900,5500,20900,12500,South
39,Mar-2025,40200,5650,21400,13150,East
40,Apr-2025,41100,5750,21800,13550,West
41,May-2025,42000,5900,22200,13900,North
42,Jun-2025,43100,6050,22700,14350,South
43,Jul-2025,44000,6200,23200,14600,East
44,Aug-2025,43500,6100,22900,14500,West
45,Sep-2025,44900,6300,23600,15000,North
46,Oct-2025,45800,6450,24100,15250,South
47,Nov-2025,47500,6700,24900,15900,East
48,Dec-2025,51500,7300,27000,17200,West
49,Jan-2026,49800,7000,26200,16600,North
50,Feb-2026,50700,7100,26600,17000,South
;
run;
/* Print EcomFinance dataset */

PROC PRINT DATA=EcomFinance;
RUN;
/* Sort by Region */

PROC SORT DATA=EcomFinance OUT=TEMP_SORTED;
    BY Region;
RUN;
/* Print sorted dataset */

PROC PRINT DATA=TEMP_SORTED;
RUN;
/*========================================================
  STEP 2: PRINT DATA
========================================================*/

PROC PRINT DATA=EcomFinance;
RUN;
/*========================================================
  STEP 3: DATASET INFORMATION
========================================================*/

PROC CONTENTS DATA=EcomFinance;
RUN;
/*========================================================
  STEP 4: SORT BY DEPARTMENT
========================================================*/

PROC SORT DATA=EcomFinance OUT=TEMP_SORTED;
    BY DEPT;
RUN;
PROC PRINT DATA=TEMP_SORTED;
RUN;
/*========================================================
  STEP 5: BASIC DESCRIPTIVE STATISTICS
========================================================*/

PROC MEANS DATA=EcomFinance
    N
    MEAN
    STD
    MIN
    MAX;

    VAR Sales Advertising Expenses Profit;

    TITLE "Basic Descriptive Statistics";
RUN;
/*========================================================
  STEP 6: DETAILED DESCRIPTIVE STATISTICS
========================================================*/

PROC MEANS DATA=EcomFinance
    N
    NMISS
    MEAN
    MEDIAN
    STD
    VAR
    MIN
    MAX
    RANGE
    SUM
    Q1
    Q3
    CV
    MAXDEC=2;

    VAR Sales Advertising Expenses Profit;

    TITLE "Detailed Descriptive Statistics";
RUN;
/*========================================================
  STEP 7: DESCRIPTIVE STATISTICS BY DEPARTMENT
========================================================*/

PROC MEANS DATA=EcomFinance
    N
    MEAN
    MEDIAN
    STD
    MIN
    MAX
    SUM
    MAXDEC=2;

    CLASS DEPT;

    VAR Sales Advertising Expenses Profit;

    TITLE "Descriptive Statistics by Department";
RUN;



DATA EcomFinance;
    SET EcomFinance;

    IF Product IN ('Laptop','Phone','Tablet') THEN DEPT='Electronics';
    ELSE IF Product IN ('Shirt','Pants','Shoes') THEN DEPT='Clothing';
    ELSE IF Product IN ('Desk','Chair','Table') THEN DEPT='Furniture';
RUN;
PROC PRINT DATA=EcomFinance(OBS=10);
RUN;

DATA EcomFinance;
    SET EcomFinance;
    DROP Product DEPT;
RUN;
PROC PRINT DATA=EcomFinance(OBS=10);
RUN;

DATA EcomFinance;
    SET EcomFinance;

    DEPT = Region;
RUN;
PROC PRINT DATA=EcomFinance(OBS=10);
RUN;

PROC MEANS DATA=EcomFinance
    N
    MEAN
    MEDIAN
    STD
    MIN
    MAX
    SUM
    MAXDEC=2;

    CLASS DEPT;

    VAR Sales Advertising Expenses Profit;

    TITLE "Descriptive Statistics by Department";
RUN;


/*========================================================
  STEP 8: DETAILED DEPARTMENT ANALYSIS
========================================================*/

PROC MEANS DATA=EcomFinance
    N
    NMISS
    MEAN
    MEDIAN
    STD
    VAR
    MIN
    MAX
    RANGE
    Q1
    Q3
    SUM
    CV
    MAXDEC=2;

    CLASS DEPT;

    VAR Sales Advertising Expenses Profit;

    TITLE "Detailed Statistics by Department";
RUN;

/*========================================================
  STEP 9: FREQUENCY OF DEPARTMENTS
========================================================*/

PROC FREQ DATA=EcomFinance;

    TABLE DEPT;

    TITLE "Frequency of Observations by Department";
RUN;
/*  Another Way...*/

PROC FREQ DATA=EcomFinance;

    TABLE DEPT / NOCUM;

    TITLE "Department Frequency and Percentage";
RUN;

/*========================================================
  STEP 10: CREATE YEAR VARIABLE
========================================================*/

DATA EcomFinance;
    SET EcomFinance;

    Year = YEAR(Date);
RUN;

PROC FREQ DATA=EcomFinance;

    TABLE Year*DEPT;

    TITLE "Department by Year";
RUN;

/*========================================================
  STEP 11: FIVE-NUMBER SUMMARY
========================================================*/

PROC UNIVARIATE DATA=EcomFinance;

    VAR Sales Advertising Expenses Profit;

    TITLE "Five-Number Summary";
RUN;

/*========================================================
  STEP 12: DISTRIBUTION ANALYSIS
========================================================*/

PROC UNIVARIATE DATA=EcomFinance;

    VAR Sales Profit;

    HISTOGRAM Sales Profit / NORMAL;

    INSET MEAN MEDIAN STD MIN MAX
          / POSITION=NE;

    TITLE "Distribution of Sales and Profit";
RUN;

/*========================================================
  STEP 13: BOX PLOT OF PROFIT BY DEPARTMENT
========================================================*/

PROC SGPLOT DATA=EcomFinance;

    VBOX Profit / CATEGORY=DEPT;

    XAXIS LABEL="Department";
    YAXIS LABEL="Profit";

    TITLE "Profit Distribution by Department";
RUN;
/*========================================================
  STEP 13: BOX PLOT OF SALES BY DEPARTMENT
========================================================*/
PROC SGPLOT DATA=EcomFinance;

    VBOX Sales / CATEGORY=DEPT;

    XAXIS LABEL="Department";
    YAXIS LABEL="Sales";

    TITLE "Sales Distribution by Department";
RUN;

/*========================================================
  STEP 14: SALES TREND
========================================================*/

PROC SGPLOT DATA=EcomFinance;

    SERIES X=Date Y=Sales / MARKERS;

    XAXIS LABEL="Month";
    YAXIS LABEL="Sales";

    TITLE "Monthly Sales Trend";
RUN;
/* Error...*/
ODS HTML5 FILE="sales_trend.html" OPTIONS(BITMAP_MODE='INLINE');

PROC SGPLOT DATA=EcomFinance;
    SERIES X=Date Y=Sales / MARKERS;

    XAXIS LABEL="Month";
    YAXIS LABEL="Sales";

    TITLE "Monthly Sales Trend";
RUN;

ODS HTML5 CLOSE;


ODS HTML5 FILE="%SYSFUNC(PATHNAME(WORK))/sales_trend.html"
    OPTIONS(BITMAP_MODE='INLINE');

PROC SGPLOT DATA=EcomFinance;
    SERIES X=Date Y=Sales / MARKERS;

    XAXIS LABEL="Month";
    YAXIS LABEL="Sales";

    TITLE "Monthly Sales Trend";
RUN;

ODS HTML5 CLOSE;

PROC PYTHON;
SUBMIT;
print("Python is working!")
ENDSUBMIT;
RUN;

%PUT SAS VERSION = &SYSVLONG;
%PUT SAS RELEASE = &SYSVLONG4;

id="8h7c2m"
PROC PRODUCT_STATUS;
RUN;

PROC SETINIT;
RUN;

/*========================================================
  STEP 15: PROFIT TREND
========================================================*/

PROC SGPLOT DATA=EcomFinance;

    SERIES X=Date Y=Profit / MARKERS;

    XAXIS LABEL="Month";
    YAXIS LABEL="Profit";

    TITLE "Monthly Profit Trend";
RUN;

/*========================================================
  STEP 16: SALES VS ADVERTISING
========================================================*/

PROC SGPLOT DATA=EcomFinance;

    SCATTER X=Advertising Y=Sales;

    XAXIS LABEL="Advertising";
    YAXIS LABEL="Sales";

    TITLE "Sales vs Advertising";
RUN;

/*========================================================
  STEP 17: CORRELATION ANALYSIS
========================================================*/

PROC CORR DATA=EcomFinance
    PEARSON
    SPEARMAN;

    VAR Sales Advertising Expenses Profit;

    TITLE "Correlation Analysis";
RUN;

/*========================================================
  STEP 18: ONE-WAY ANOVA
========================================================*/

PROC GLM DATA=EcomFinance;

    CLASS DEPT;

    MODEL Profit = DEPT;

    TITLE "One-Way ANOVA: Profit by Department";
RUN;

QUIT;

/*========================================================
  STEP 19: ANOVA WITH TUKEY MULTIPLE COMPARISON
========================================================*/

PROC GLM DATA=EcomFinance;

    CLASS DEPT;

    MODEL Profit = DEPT;

    MEANS DEPT / TUKEY;

    TITLE "ANOVA and Tukey Test for Profit by Department";
RUN;

QUIT;

/*========================================================
  STEP 20: ANOVA DIAGNOSTICS
========================================================*/

PROC GLM DATA=EcomFinance;

    CLASS DEPT;

    MODEL Profit = DEPT;

    MEANS DEPT / HOVTEST=LEVENE;

    OUTPUT OUT=ANOVA_RESULT
           PREDICTED=Predicted
           RESIDUAL=Residual;

    TITLE "ANOVA Diagnostic Analysis";
RUN;

QUIT;

/*========================================================
  STEP 21: MULTIPLE REGRESSION
========================================================*/

PROC REG DATA=EcomFinance;

    MODEL Profit = Sales Advertising Expenses;

    TITLE "Multiple Regression: Predicting Profit";
RUN;

QUIT;

/*========================================================
  STEP 22: ARIMA IDENTIFICATION
========================================================*/

PROC ARIMA DATA=EcomFinance;

    IDENTIFY VAR=Sales
              NLAG=12;

RUN;

QUIT;

/*========================================================
  STEP 24: ARIMA FORECAST
========================================================*/

PROC ARIMA DATA=EcomFinance;

    IDENTIFY VAR=Sales
              NLAG=12;

    ESTIMATE P=1 D=1 Q=1
             METHOD=ML;

    FORECAST LEAD=12
             OUT=SalesForecast
             ID=Date
             INTERVAL=MONTH;

RUN;

QUIT;

/*========================================================
  STEP 25: ARIMA FORECAST GRAPH
========================================================*/

PROC SGPLOT DATA=SalesForecast;

    SERIES X=Date Y=Sales
        / MARKERS
          LINEATTRS=(COLOR=BLUE);

    SERIES X=Date Y=Forecast
        / LINEATTRS=(COLOR=RED THICKNESS=2);

    BAND X=Date
         UPPER=U95
         LOWER=L95
         / TRANSPARENCY=0.5;

    XAXIS LABEL="Month";
    YAXIS LABEL="Sales";

    TITLE "ARIMA Sales Forecast";
RUN;

/*========================================================
  STEP 26: DEPARTMENT SUMMARY
========================================================*/

PROC SQL;

    CREATE TABLE DepartmentSummary AS

    SELECT
        DEPT,
        COUNT(*) AS Number_of_Records,
        MEAN(Sales) AS Average_Sales,
        MEAN(Advertising) AS Average_Advertising,
        MEAN(Expenses) AS Average_Expenses,
        MEAN(Profit) AS Average_Profit,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit

    FROM EcomFinance

    GROUP BY DEPT;

QUIT;
PROC PRINT DATA=DepartmentSummary;
    TITLE "EcomFinance Department Summary";
RUN;

