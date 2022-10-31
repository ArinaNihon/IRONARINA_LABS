# Query 1
select client_id from bank.client
WHERE district_id  =1 
LIMIT 5;
# Query 2
select max(client_id) from bank.client
WHERE district_id  =72;
# Query 3
select amount from bank.loan
ORDER BY amount asc
LIMIT 3;
# Query 4
select distinct status from bank.loan
ORDER BY status asc;
# Query 5
select loan_id from bank.loan
ORDER BY payments desc
LIMIT 1;
# Query 6
select account_id, amount from bank.loan
ORDER BY account_id asc
LIMIT 5;
# Query 7
select account_id from bank.loan
Where duration=60
ORDER BY amount asc
LIMIT 5;
# Query 8
select distinct k_symbol from bank.order;
# Query 9
select order_id from bank.order
WHERE account_id=34;
# Query 10
select distinct account_id from bank.order
WHERE order_id>29540 and order_id<=29560;
# Query 11
select amount from bank.order
Where account_to=30067122;
# Query 12
select trans_id, date, type, amount from bank.trans
Where account_id=793
ORDER BY date desc
LIMIT 10;
# Query 13
select district_id, count(client_id) from bank.client
WHERE district_id < 10
group by district_id
order by district_id asc;
# Query 14
select distinct type, count(card_id) from bank.card
group by type;
# Query 15
select account_id, amount from bank.loan
order by amount desc
LIMIT 10;
# Query 16
select amount,date from bank.loan
where date <930907
order by date desc;
# Query 17
select distinct duration,date,count(loan_id)  from bank.loan
where date >971200 and date<980000
group by date
order by date, duration asc;
# Query 18
select account_id,type,sum(amount) from bank.trans
where account_id=396 
group by type;
# Query 19
select account_id,sum(amount), case WHEN type='VYDAJ' THEN 'Outgoing'
WHEN type='PRIJEM' THEN 'Incoming' END as new_type from bank.trans
where account_id=396
group by type;
# Query 20
WITH temporaryTable(account_id) as
    (SELECT sum(amount))
    from account_id)
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;
