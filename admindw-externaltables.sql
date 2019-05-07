begin
 dbms_cloud.create_external_table(
    table_name =>'CHANNELS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/8N9T5Rls0s5JYMar24zqof-l5eTtQjiGrjD4PmOkKG8/n/oraseemeatechse/b/esadw/o/chan_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true'),
    column_list => 'CHANNEL_ID NUMBER,
	CHANNEL_DESC VARCHAR2(20),
	CHANNEL_CLASS VARCHAR2(20),
	CHANNEL_CLASS_ID NUMBER,
	CHANNEL_TOTAL VARCHAR2(13),
	CHANNEL_TOTAL_ID NUMBER'
 );
end;
/

select count(*) from CHANNELS_EXT;

begin
 dbms_cloud.create_external_table(
    table_name =>'COUNTRIES_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/WilSQR3OlAIvQP7kOQjkwGwVmVEf3hnIcL5Ab45nWrE/n/oraseemeatechse/b/esadw/o/coun_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true'),
    column_list => 'COUNTRY_ID NUMBER ,
	COUNTRY_ISO_CODE CHAR(2) ,
	COUNTRY_NAME VARCHAR2(40) ,
	COUNTRY_SUBREGION VARCHAR2(30) ,
	COUNTRY_SUBREGION_ID NUMBER ,
	COUNTRY_REGION VARCHAR2(20) ,
	COUNTRY_REGION_ID NUMBER ,
	COUNTRY_TOTAL VARCHAR2(11) ,
	COUNTRY_TOTAL_ID NUMBER ,
	COUNTRY_NAME_HIST VARCHAR2(40)'
 );
end;
/

select count(*) from countries_ext;


begin
 dbms_cloud.create_external_table(
    table_name =>'CUSTOMERS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/nlDcfgCHyQVzP8A-xT2BDXCG9mvqDwEYgrPRSWj9QD4/n/oraseemeatechse/b/esadw/o/cust1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS'),
    column_list => 'CUST_ID NUMBER ,
	CUST_FIRST_NAME VARCHAR2(20) ,
	CUST_LAST_NAME VARCHAR2(40) ,
	CUST_GENDER CHAR(1) ,
	CUST_YEAR_OF_BIRTH NUMBER(4,0) ,
	CUST_MARITAL_STATUS VARCHAR2(20),
	CUST_STREET_ADDRESS VARCHAR2(40) ,
	CUST_POSTAL_CODE VARCHAR2(10) ,
	CUST_CITY VARCHAR2(30) ,
	CUST_CITY_ID NUMBER ,
	CUST_STATE_PROVINCE VARCHAR2(40) ,
	CUST_STATE_PROVINCE_ID NUMBER ,
	COUNTRY_ID NUMBER ,
	CUST_MAIN_PHONE_NUMBER VARCHAR2(25) ,
	CUST_INCOME_LEVEL VARCHAR2(30),
	CUST_CREDIT_LIMIT NUMBER,
	CUST_EMAIL VARCHAR2(50),
	CUST_TOTAL VARCHAR2(14) ,
	CUST_TOTAL_ID NUMBER ,
	CUST_SRC_ID NUMBER,
	CUST_EFF_FROM DATE,
	CUST_EFF_TO DATE,
	CUST_VALID VARCHAR2(1)'
 );
end;
/

select count(*) from customers_ext;



begin
 dbms_cloud.create_external_table(
    table_name =>'SUPPLEMENTARY_DEMOGRAPHICS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/O--Q-8WYnMlZBC70ZydZA4zoC8Orf7cS-rZ7ICysQVU/n/oraseemeatechse/b/esadw/o/dem1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true'),
    column_list => 'CUST_ID NUMBER ,
	EDUCATION VARCHAR2(21),
	OCCUPATION VARCHAR2(21),
	HOUSEHOLD_SIZE VARCHAR2(21),
	YRS_RESIDENCE NUMBER,
	AFFINITY_CARD NUMBER(10,0),
	BULK_PACK_DISKETTES NUMBER(10,0),
	FLAT_PANEL_MONITOR NUMBER(10,0),
	HOME_THEATER_PACKAGE NUMBER(10,0),
	BOOKKEEPING_APPLICATION NUMBER(10,0),
	PRINTER_SUPPLIES NUMBER(10,0),
	Y_BOX_GAMES NUMBER(10,0),
	OS_DOC_SET_KANJI NUMBER(10,0),
	COMMENTS VARCHAR2(4000)'
 );
end;
/

select count(*) from SUPPLEMENTARY_DEMOGRAPHICS_EXT;


begin
 dbms_cloud.create_external_table(
    table_name =>'PRODUCTS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/QiD6yP3BFxWqiyBrULSwxnJ7cVpN3v62q6PjyPzLlO4/n/oraseemeatechse/b/esadw/o/prod1v3.dat',
    format => json_object('delimiter' value '|', 'quote' value '^', 'ignoremissingcolumns' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true'),
    column_list => 'PROD_ID NUMBER(6,0) ,
	PROD_NAME VARCHAR2(50) ,
	PROD_DESC VARCHAR2(4000) ,
	PROD_SUBCATEGORY VARCHAR2(50) ,
	PROD_SUBCATEGORY_ID NUMBER ,
	PROD_SUBCATEGORY_DESC VARCHAR2(2000) ,
	PROD_CATEGORY VARCHAR2(50) ,
	PROD_CATEGORY_ID NUMBER ,
	PROD_CATEGORY_DESC VARCHAR2(2000) ,
	PROD_WEIGHT_CLASS NUMBER(3,0) ,
	PROD_UNIT_OF_MEASURE VARCHAR2(20),
	PROD_PACK_SIZE VARCHAR2(30) ,
	SUPPLIER_ID NUMBER(6,0) ,
	PROD_STATUS VARCHAR2(20) ,
	PROD_LIST_PRICE NUMBER(8,2) ,
	PROD_MIN_PRICE NUMBER(8,2) ,
	PROD_TOTAL VARCHAR2(13) ,
	PROD_TOTAL_ID NUMBER ,
	PROD_SRC_ID NUMBER,
	PROD_EFF_FROM DATE,
	PROD_EFF_TO DATE,
	PROD_VALID VARCHAR2(1)'
 );
end;
/

select count(*) from PRODUCTS_EXT;


begin
 dbms_cloud.create_external_table(
    table_name =>'PROMOTIONS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/pDVwFv-_UlecVIT5gKk0zUR4sz_j9XbHPjWXCFrZXi8/n/oraseemeatechse/b/esadw/o/prom1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true'),
    column_list => 'PROMO_ID NUMBER(6,0) ,
	PROMO_NAME VARCHAR2(30) ,
	PROMO_SUBCATEGORY VARCHAR2(30) ,
	PROMO_SUBCATEGORY_ID NUMBER ,
	PROMO_CATEGORY VARCHAR2(30) ,
	PROMO_CATEGORY_ID NUMBER ,
	PROMO_COST NUMBER(10,2) ,
	PROMO_BEGIN_DATE DATE ,
	PROMO_END_DATE DATE ,
	PROMO_TOTAL VARCHAR2(15) ,
	PROMO_TOTAL_ID NUMBER '
 );
end;
/

select count(*) from promotions_ext;

begin
 dbms_cloud.create_external_table(
    table_name =>'SALES_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/UJ8mhw2AABifK2IcNiVpUPpqdXgkjIHeTR7uG3w40Mc/n/oraseemeatechse/b/esadw/o/dmsal_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD', 'blankasnull' value 'true'),
    column_list => 'PROD_ID NUMBER ,
	CUST_ID NUMBER ,
	TIME_ID DATE ,
	CHANNEL_ID NUMBER ,
	PROMO_ID NUMBER ,
	QUANTITY_SOLD NUMBER(10,2) ,
	AMOUNT_SOLD NUMBER(10,2)'
 );
end;
/

select count(*)  from sales_ext;


begin
 dbms_cloud.create_external_table(
    table_name =>'TIMES_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/7NSsyBXcbGwn1Owe4rqq0W_pKg8Rzfnbm55iuHPshXw/n/oraseemeatechse/b/esadw/o/time_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true'),
    column_list => 'TIME_ID DATE ,
	DAY_NAME VARCHAR2(9) ,
	DAY_NUMBER_IN_WEEK NUMBER(1,0) ,
	DAY_NUMBER_IN_MONTH NUMBER(2,0) ,
	CALENDAR_WEEK_NUMBER NUMBER(2,0) ,
	FISCAL_WEEK_NUMBER NUMBER(2,0) ,
	WEEK_ENDING_DAY DATE ,
	WEEK_ENDING_DAY_ID NUMBER ,
	CALENDAR_MONTH_NUMBER NUMBER(2,0) ,
	FISCAL_MONTH_NUMBER NUMBER(2,0) ,
	CALENDAR_MONTH_DESC VARCHAR2(8) ,
	CALENDAR_MONTH_ID NUMBER ,
	FISCAL_MONTH_DESC VARCHAR2(8) ,
	FISCAL_MONTH_ID NUMBER ,
	DAYS_IN_CAL_MONTH NUMBER ,
	DAYS_IN_FIS_MONTH NUMBER ,
	END_OF_CAL_MONTH DATE ,
	END_OF_FIS_MONTH DATE ,
	CALENDAR_MONTH_NAME VARCHAR2(9) ,
	FISCAL_MONTH_NAME VARCHAR2(9) ,
	CALENDAR_QUARTER_DESC CHAR(7) ,
	CALENDAR_QUARTER_ID NUMBER ,
	FISCAL_QUARTER_DESC CHAR(7) ,
	FISCAL_QUARTER_ID NUMBER ,
	DAYS_IN_CAL_QUARTER NUMBER ,
	DAYS_IN_FIS_QUARTER NUMBER ,
	END_OF_CAL_QUARTER DATE ,
	END_OF_FIS_QUARTER DATE ,
	CALENDAR_QUARTER_NUMBER NUMBER(1,0) ,
	FISCAL_QUARTER_NUMBER NUMBER(1,0) ,
	CALENDAR_YEAR NUMBER(4,0) ,
	CALENDAR_YEAR_ID NUMBER ,
	FISCAL_YEAR NUMBER(4,0) ,
	FISCAL_YEAR_ID NUMBER ,
	DAYS_IN_CAL_YEAR NUMBER ,
	DAYS_IN_FIS_YEAR NUMBER ,
	END_OF_CAL_YEAR DATE ,
	END_OF_FIS_YEAR DATE '
 );
end;
/

select count(*) from times_ext;


begin
 dbms_cloud.create_external_table(
    table_name =>'COSTS_EXT',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/x5D8Y19gWj-n9tdd3cv-VokUxGgdQfBTGyavEsUqa80/n/oraseemeatechse/b/esadw/o/costs.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'dateformat' value 'YYYY-MM-DD', 'blankasnull' value 'true'),
    column_list => 'PROD_ID NUMBER ,
	TIME_ID DATE ,
	PROMO_ID NUMBER ,
	CHANNEL_ID NUMBER ,
	UNIT_COST NUMBER(10,2) ,
	UNIT_PRICE NUMBER(10,2) '
 );
end;
/

select count(*) from costs_ext;

SELECT c.cust_id, t.calendar_quarter_desc, TO_CHAR (SUM(amount_sold),
  '9,999,999,999.99') AS Q_SALES, TO_CHAR(SUM(SUM(amount_sold))
OVER (PARTITION BY c.cust_id ORDER BY c.cust_id, t.calendar_quarter_desc
ROWS UNBOUNDED
PRECEDING), '9,999,999,999.99') AS CUM_SALES
  FROM sales_ext s, times t, customers_ext c
  WHERE s.time_id=t.time_id AND s.cust_id=c.cust_id AND t.calendar_year=2000
    AND c.cust_id IN (2595, 9646, 11111)
  GROUP BY c.cust_id, t.calendar_quarter_desc
  ORDER BY c.cust_id, t.calendar_quarter_desc;