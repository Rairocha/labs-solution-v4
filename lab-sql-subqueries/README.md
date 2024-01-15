![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB | SQL Subqueries

<details>
  <summary>
   <h2>Learning Goals</h2>
  </summary>

  This lab allows you to practice and apply the concepts and techniques taught in class. 

  Upon completion of this lab, you will be able to:
  
- Use advanced SQL queries (e.g., subqueries, window functions) to perform more complex data manipulations and analysis.

  <br>
  <hr> 

</details>

<details>
  <summary>
   <h2>Prerequisites</h2>
  </summary>

Before this starting this lab, you should have learnt about:

- SELECT, FROM, ORDER BY, LIMIT, WHERE, GROUP BY, and HAVING clauses. DISTINCT, AS keywords.
- Built-in SQL functions such as COUNT, MAX, MIN, AVG, ROUND, DATEDIFF, or DATE_FORMAT.
- JOIN to combine data from multiple tables.
- Subqueries
 
  <br>
  <hr> 

</details>


## Introduction

Welcome to the SQL Subqueries lab!

In this lab, you will be working with the [Sakila](https://dev.mysql.com/doc/sakila/en/) database on movie rentals. Specifically, you will be practicing how to perform subqueries, which are queries embedded within other queries. Subqueries allow you to retrieve data from one or more tables and use that data in a separate query to retrieve more specific information.

## Challenge

Write SQL queries to perform the following tasks using the Sakila database:

1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
2. List all films whose length is longer than the average length of all the films in the Sakila database.
3. Use a subquery to display all actors who appear in the film "Alone Trip".

**Bonus**:

4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films. 
5. Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.
6. Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.
7. Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.
8. Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. You can use subqueries to accomplish this.

## Requirements

- Fork this repo
- Clone it to your machine


## Getting Started

Complete the challenges in this readme in a `.sql`file.

## Submission

- Upon completion, run the following commands:

```bash
git add .
git commit -m "Solved lab"
git push origin master
```

- Paste the link of your lab in Student Portal.



