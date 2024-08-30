CREATETABLE products (product_idINTPRIMARYKEY, name VARCHAR2(200), description VARCHAR2(400), price INT, weight INT, imageVARCHAR2(200), quantity INT);
CREATETABLE categories (category_idINTPRIMARYKEY, name VARCHAR2(200), description VARCHAR2(200));
CREATETABLE customers (customer_idINTPRIMARYKEY, email VARCHAR2(200), password VARCHAR2(200), name VARCHAR2(200), address VARCHAR2(200), city VARCHAR2(200), state VARCHAR2(200), country VARCHAR2(200), pincodeINT, mobile VARCHAR2(40), DOB DATE);
CREATETABLE orders (order_idINTPRIMARYKEY, customer_idINTREFERENCES customers(customer_id), amount INT, order_date DATE, delivery_date DATE, payment_idVARCHAR2(200));
CREATETABLE product_category (product_category_idINTPRIMARYKEY, product_idINTREFERENCES products(product_id), category_idINTREFERENCES categories(category_id));
CREATETABLE order_product (order_product_idINTPRIMARYKEY, product_idINTREFERENCES products(product_id), order_idINTREFERENCES orders(order_id), quantity INT);
INSERTINTO products VALUES (1, 'p1', 'p1-desc', 100, 10, 'link1', 20);
INSERTINTO products VALUES (2, 'p2', 'p2-desc', 200, 20, 'link2', 30);
INSERTINTO products VALUES (3, 'p3', 'p3-desc', 300, 30, 'link3', 40);
INSERTINTO products VALUES (4, 'p4', 'p4-desc', 400, 40, 'link4', 50);
INSERTINTO products VALUES (5, 'p5', 'p5-desc', 500, 50, 'link5', 60);
INSERTINTO products VALUES (6, 'p6', 'p6-desc', 600, 60, 'link6', 70);

SELECT*FROM products; //Just to show the table with attributes and values


INSERTINTO categories VALUES (1, 'c1', 'c1-desc');
INSERTINTO categories VALUES (2, 'c2', 'c2-desc');
INSERTINTO categories VALUES (3, 'c3', 'c3-desc');
INSERTINTO categories VALUES (4, 'c4', 'c4-desc');
INSERTINTO categories VALUES (5, 'c5', 'c5-desc');
INSERTINTO categories VALUES (6, 'c6', 'c6-desc');

SELECT*FROM categories;//Just to show table with attributes andvalues


INSERTINTO customers VALUES(1, 'c1@email.com', 'c1-pass', 'c1', 'c1-addr', 'c1-city', 'c1-state', 'c1-country', '100000', '1','01-JAN-2000');
INSERTINTO customers VALUES(2, 'c2@email.com', 'c2-pass', 'c2', 'c2-addr', 'c2-city', 'c2-state', 'c2-country','100001', '2', '10-OCT-1995');
INSERTINTO customers VALUES(3, 'c3@email.com', 'c3-pass', 'c3', 'c3-addr', 'c3-city', 'c3-state', 'c3-country','100002', '3', '15-SEP-1998');
INSERTINTO customers VALUES(4, 'c4@email.com', 'c4-pass', 'c4', 'c4-addr', 'c4-city', 'c4-state', 'c4-country','100003', '4', '20-MAR-2002');
INSERTINTO customers VALUES(5, 'c5@email.com', 'c5-pass', 'c5', 'c5-addr', 'c5-city', 'c5-state', 'c5-country','100004', '5', '28-JUN-1999');
INSERTINTO customers VALUES(6, 'c6@email.com', 'c6-pass', 'c6', 'c6-addr', 'c6-city', 'c6-state', 'c6-country','100005', '6', '05-DEC-2001');

SELECT*FROM customers;//Just to show table with attributes and values

INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (1, 1, 100,'10-JAN-2022','21-JAN-2022', 'payment1');
INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (2, 2, 200,'27-FEB-2022','01-MAR-2022', 'payment2');
INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (3, 3, 300,'12-MAR-2022','15-MAR-2022', 'payment3');
INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (4, 4, 400,'04-JUL-2021','08-JUL-2021', 'payment4');
INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (5, 5, 500,'05-OCT-2021','07-OCT-2021', 'payment5');
INSERTINTOorders(order_id, customer_id, amount, order_date, delivery_date, payment_id) VALUES (6, 6, 600,'10-JUN-2020','15-JUN-2020', 'payment6');

SELECT*FROM orders;//Just to show the table with attributes and values


INSERTINTOproduct_categoryVALUES (1, 1, 1);
INSERTINTOproduct_categoryVALUES (2, 2, 2);
INSERTINTOproduct_categoryVALUES (3, 3, 3);
INSERTINTOproduct_categoryVALUES (4, 4, 4);
INSERTINTOproduct_categoryVALUES (5, 5, 5);
INSERTINTOproduct_categoryVALUES (6, 6, 6);

SELECT*FROMproduct_category

// If you wish to get details of entire products information including categories use the following command:
SELECT*FROMproduct_category pc JOIN products p ONpc.product_id=p.product_idJOIN categories c ONpc.category_id=c.category_id;


INSERTINTOorder_productVALUES (1, 1, 1, 1);
INSERTINTOorder_productVALUES (2, 2, 2, 1);
INSERTINTOorder_productVALUES (3, 3, 3, 1);
INSERTINTOorder_productVALUES (4, 4, 4, 1);
INSERTINTOorder_productVALUES (5, 5, 5, 1);
INSERTINTOorder_productVALUES (6, 6, 6, 1);

SELECT*FROMorder_product

// If you wish to get details of entire ordersinformation including categories use the following command:

SELECT*FROMorder_product op JOIN orders o ONo.order_id=op.order_idJOIN products p ONop.product_id=p.product_id;
Total Number of Products Sold
SELECTSUM(quantity) FROMorder_product;

Total Number of a specific Products Sold
SELECTSUM(quantity) FROMorder_productWHEREproduct_id=(SELECTproduct_idFROM products WHERE name='p1');

Total cost earned by specific product
SELECTSUM(op.quantity*p.price) FROMorder_product op JOIN products p ONop.product_id=p.product_idWHERE p.name='p4';

Customers Buying More than a specific amount in a single order
SELECT*FROM customers c JOIN orders o ONc.customer_id=o.customer_idwhereocu.amount>300;

Users who spent greater than some amount
SELECTo.customer_idFROM customers c JOIN orders o ONc.customer_id=o.customer_idGROUPBYc.customer_idHAVINGSUM(o.amount) >300;

Total Amount spent by each user
SELECTo.customer_id,SUM(o.amount) FROM customers c JOIN orders o ONc.customer_id=o.customer_idGROUPBYc.customer_id;
To print total no. of orders
createorreplaceproceduretot_orders
is
quannumber(5);
begin
selectcount(*) intoquanfrom orders;
dbms_output.put_line('total '||quan);
end;
To print total ammount of value present in your orders
createorreplaceproceduretot_cost
is
costs number(5);
begin
selectsum(amount) into costs from orders;  
dbms_output.put_line('total '|| costs);
end;
Procedure to automatically apply discount based on order value
createorreplaceprocedure discount
is
costs number(5);
begin
selectsum(amount) into costs from orders;
if (costs<=500) then
costs := costs-0;
elsif (costs>500and costs <=1000) then
costs :=0.9*costs;
else
costs :=0.8*costs;
endif;
dbms_output.put_line('Total cost after discount '|| costs);
end;

This takes coupon code to apply discount based on coupon code
createorreplaceprocedurecoupon(code innumber)
is
costs number(5);
coup_10 number(9):=1032;
coup_5 number(9):=8532;
begin
selectsum(amount) into costs from orders;  
if (code = coup_10) then
costs:=costs*0.9;
dbms_output.put_line('Discount applied: '||10||' percent');
elsif (code = coup_5) then
costs:=costs*0.95;
dbms_output.put_line('Discount applied: '||5||' percent');
endif;
dbms_output.put_line('Total checkout value '||costs);
end;

To filter products based on cost
createorreplaceprocedurecost_filter(c innumber,tinvarchar)
is
    cs products.price%type;
    ty products.name%type;
    id products.product_id%type;
cursorcfis
selectproduct_id,price,namefrom product where price<c;
begin
opencf;
    loop
fetchcfintoid,cs,ty;
exitwhencf%notfound;
dbms_output.put_line('Product'|| id ||'has cost '|| cs ||' and the product is '|| ty);
end loop;
closecf;
    exception
whenno_data_foundthen
dbms_output.put_line('Sorry no such products exist');
end;

