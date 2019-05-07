/* cleanup previous configs */
/*  delete all temp tables */

begin
    DBMS_CLOUD.DELETE_ALL_OPERATIONS ();
end;
/

select table_name from user_tables;

/* ccheck stored config  */

select  * from user_credentials;


begin
    DBMS_CLOUD.DROP_CREDENTIAL (credential_name => 'OBJ_STORE_CRED_ADW');
end;
/


/* Please fill in your OCI Object Store username and auth token below */
set define off
begin
  DBMS_CLOUD.create_credential(
    credential_name => 'OBJ_STORE_CRED_ADW',
    username => 'your accountm',
    password => 'your password'
  );
end;
/

DROP table CHANNELS_CLOUD;

CREATE TABLE  CHANNELS_CLOUD ( CHANNEL_ID VARCHAR2(26),
  CHANNEL_DESC VARCHAR2(26),
  CHANNEL_CLASS VARCHAR2(26),
  CHANNEL_CLASS_ID VARCHAR2(26),
  CHANNEL_TOTAL VARCHAR2(26),
  CHANNEL_TOTAL_ID VARCHAR2(26));

/* only if you want to reply the load  
truncate table   CHANNELS_CLOUD;
*/

begin
 dbms_cloud.copy_data(
    table_name =>'CHANNELS_CLOUD',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/8N9T5Rls0s5JYMar24zqof-l5eTtQjiGrjD4PmOkKG8/n/oraseemeatechse/b/esadw/o/chan_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
 );
end;
/

select * from CHANNELS_CLOUD;

/* Specify the base URL that you copied from your files in OCI Object Storage in the define base_URL line below*/
/* change adwctraining8 to your real tenancy name. The name is case-sensitive. */
/* change ADWCLab to your real bucket name. The name is case-sensitive. */
/* change us-phoenix-1 to your real region name. The name is case-sensitive. */
/* you can find these values on the OCI Console .. Storage .. Object Storage screen */

truncate table channels;

begin
 dbms_cloud.copy_data(
    table_name =>'CHANNELS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/8N9T5Rls0s5JYMar24zqof-l5eTtQjiGrjD4PmOkKG8/n/oraseemeatechse/b/esadw/o/chan_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
 );
end;
/

select count(*) from channels;

truncate table countries;

begin
 dbms_cloud.copy_data(
    table_name =>'COUNTRIES',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/WilSQR3OlAIvQP7kOQjkwGwVmVEf3hnIcL5Ab45nWrE/n/oraseemeatechse/b/esadw/o/coun_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
 );
end;
/

select count(*) from countries;


truncate table customers;
begin
 dbms_cloud.copy_data(
    table_name =>'CUSTOMERS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/nlDcfgCHyQVzP8A-xT2BDXCG9mvqDwEYgrPRSWj9QD4/n/oraseemeatechse/b/esadw/o/cust1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS')
 );
end;
/
select * from customers;

truncate table SUPPLEMENTARY_DEMOGRAPHICS;
begin
 dbms_cloud.copy_data(
    table_name =>'SUPPLEMENTARY_DEMOGRAPHICS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/O--Q-8WYnMlZBC70ZydZA4zoC8Orf7cS-rZ7ICysQVU/n/oraseemeatechse/b/esadw/o/dem1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true')
 );
end;
/
select count(*)  from SUPPLEMENTARY_DEMOGRAPHICS;

truncate table sales;
begin
 dbms_cloud.copy_data(
    table_name =>'SALES',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/UJ8mhw2AABifK2IcNiVpUPpqdXgkjIHeTR7uG3w40Mc/n/oraseemeatechse/b/esadw/o/dmsal_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD')
 );
end;
/
select count(*) from sales ;

truncate table products;
begin
 dbms_cloud.copy_data(
    table_name =>'PRODUCTS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/QiD6yP3BFxWqiyBrULSwxnJ7cVpN3v62q6PjyPzLlO4/n/oraseemeatechse/b/esadw/o/prod1v3.dat',
    format => json_object('delimiter' value '|', 'quote' value '^', 'ignoremissingcolumns' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true')
 );
end;
/
select * from products;

truncate table promotions;
begin
 dbms_cloud.copy_data(
    table_name =>'PROMOTIONS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/pDVwFv-_UlecVIT5gKk0zUR4sz_j9XbHPjWXCFrZXi8/n/oraseemeatechse/b/esadw/o/prom1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true')
 );
end;
/
select count(*) from promotions;

begin
 dbms_cloud.copy_data(
    table_name =>'SALES',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/n2ihptJ2rgpppZmMWdbxqmCufXEuV19hXPaERIVObNw/n/oraseemeatechse/b/esadw/o/sale1v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD', 'blankasnull' value 'true')
 );
end;
/
select * from sales;

begin
 dbms_cloud.copy_data(
    table_name =>'TIMES',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/7NSsyBXcbGwn1Owe4rqq0W_pKg8Rzfnbm55iuHPshXw/n/oraseemeatechse/b/esadw/o/time_v3.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'removequotes' value 'true', 'dateformat' value 'YYYY-MM-DD-HH24-MI-SS', 'blankasnull' value 'true')
 );
end;
/
select count(*) from times;

begin
 dbms_cloud.copy_data(
    table_name =>'COSTS',
    credential_name =>'OBJ_STORE_CRED_ADW',
    file_uri_list =>'https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/x5D8Y19gWj-n9tdd3cv-VokUxGgdQfBTGyavEsUqa80/n/oraseemeatechse/b/esadw/o/costs.dat',
    format => json_object('ignoremissingcolumns' value 'true', 'dateformat' value 'YYYY-MM-DD', 'blankasnull' value 'true')
 );
end;
/
select count(*) from costs;
