-- 1. Count the total number of books in each category
SELECT c.category_name, count(b.book_id) as total_books
FROM category c JOIN book b ON c.category_id = b.category_id
GROUP BY c.category_name;

-- 2. Count how many books each author has written (based on book-author mapping)
SELECT a.name, count(ba.book_id) as books_written
FROM author a JOIN book_author ba ON a.author_id = ba.author_id
group by a.author_id, a.name;

-- 3. Count how many books each member has borrowed
SELECT CONCAT(m.first_name, ' ', m.last_name) AS member_name, COUNT(l.loan_id) AS total_loans
FROM member m JOIN loan l ON m.member_id = l.member_id
GROUP BY m.member_id;

-- 4. Calculate the average publication year of books in each category
SELECT c.category_name, AVG(b.publication_year) AS avg_pub_year
FROM book b JOIN category c ON b.category_id = c.category_id
GROUP BY c.category_name;

-- 5. Show categories that have more than 2 books
select c.category_name, count(b.book_id) as no_of_books
from book b join category c on b.category_id = c.category_id
group by c.category_name having count(b.book_id)>2;

-- 6. Count how many currently borrowed books exist per category
select c.category_name, count(b.book_id) as borrowed_books
from loan l join book b on b.book_id = l.book_id 
join category c on b.category_id = c.category_id
where l.return_date is null
group by c.category_name; 

-- 7. Show members who have borrowed more than one book
SELECT CONCAT(m.first_name, ' ', m.last_name) AS member_name, COUNT(*) AS loan_count
FROM member m JOIN loan l ON m.member_id = l.member_id
GROUP BY m.member_id HAVING COUNT(*) > 1;
