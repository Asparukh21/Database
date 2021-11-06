--1)
select all from dealer inner join client on dealer.id= client.dealer_id;
--2)
select dealer.name, client.name,city,sell.id,date,amount from dealer inner join client on client.dealer_id=dealer.id inner join sell on client.id=sell.client_id;
--3)
select AlL from dealer inner join client on dealer.dealer_id where dealer.location= client.city;
--4)
select sell.id,sell.amount,client.name,client.city from client inner join sell on client.id= sell.client_id and amount between 100 and 500;
--5)
select all from dealer left join client on dealer.id=client.dealer_id;
--6)
select client.name,client.city,dealer.name,dealer.charge from dealer inner join client on dealer.id= client.dealer_id;
--7)
select client.name,client.city,dealer.name,dealer.charge from dealer inner join client on dealer.id= client.dealer_id where dealer >0.12;
--8)
select client.name, client.city, sell.id,sell.date,sell.amount,dealer.name,dealer.charge, from dealer inner join client on dealer.id =client.dealer_id inner join sell on client.id=sell.client_id;
--9)
--10)
create view numberofuniqueclients(number) as select count(distinct client.id) from client;
create view amountofpurchase(total_amount,average_amount,date) as select sum(amount),avg(amount),date from sell;
--11)
create view fivetop as select all from (select all from amountofpurchase order by  total_amount desc ) as s limit 5;
--12)
create view saledealer(number_of_sales,average_amount,total_amount,dealer_name) as select count(sell.id),avg(amount),sum(amount),dealer.name from dealer inner join sell on dealer.id=sell.dealer_id group by dealer.id;
--13)
create view Dealers(dealers_earn,location) as select sum(charge*amount),location from dealer inner join sell on dealer.id=sell.dealer_id group by location;
--14)
create view Locationofsales(location,sales_number_of_sales,sales_average_amount,sales_total_amount) as select location,count(sell.id),avg(amount),sum(amount) from dealer inner join sell on dealer.id=sell.dealer_id group by location;