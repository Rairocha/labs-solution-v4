![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB | Web Scraping
<details>
  <summary>
   <h2>Learning Goals</h2>
  </summary>

  This lab allows you to practice and apply the concepts and techniques taught in class. 

  Upon completion of this lab, you will be able to:
  
- Use Python libraries such as requests and Beautiful Soup to extract data from websites, and convert extracted data into a suitable data structure.

  <br>
  <hr> 

</details>


## Introduction

Welcome to your next challenge, aspiring data explorers!

In today’s digital age, data serves as the backbone of many decision-making processes, and the entertainment industry is no exception. Companies use vast arrays of data to gauge audience preferences, track market trends, and make informed decisions that could potentially lead to the next Netflix hit.

In this lab, you will step into the shoes of a data analyst working for a leading film production company. Your mission? To scrape IMDb, one of the world's largest online databases for movies, TV, and celebrity info, and extract meaningful data that can aid understanding the film landscape during a specified period.

Leveraging Python along with libraries such as BeautifulSoup and Pandas, you will build a script to scrape movie data based on specific criteria: title type, user rating, and release dates. The extracted data will be organized into a well-structured pandas DataFrame, ready for analysis.

As you navigate through this lab, not only will you enhance your web scraping skills, but you will also explore the fascinating world of movies, uncovering trends and insights that lie hidden in IMDb's extensive database.

Prepare yourself for an adventure into the world of big data and movies. Every line of code takes you a step closer to becoming a data wizard in the cinematic universe. Let's delve into the data and may the insights be with you!

<br>

**Happy coding!** :heart:


## Requirements

- Fork this repo
- Clone it to your machine

## Getting Started

Complete the challenges in the `Jupyter Notebook` file. Follow the instructions and add your code and explanations as necessary.

## Submission

- Upon completion, run the following commands:

```bash
git add .
git commit -m "Solved lab"
git push origin master
```

- Paste the link of your lab in Student Portal.


## FAQs
<details>
  <summary>I am stuck in the exercise and don't know how to solve the problem or where to start.</summary>
  <br>

  If you are stuck in your code and don't know how to solve the problem or where to start, you should take a step back and try to form a clear question about the specific issue you are facing. This will help you narrow down the problem and come up with potential solutions.


  For example, is it a concept that you don't understand, or are you receiving an error message that you don't know how to fix? It is usually helpful to try to state the problem as clearly as possible, including any error messages you are receiving. This can help you communicate the issue to others and potentially get help from classmates or online resources. 


  Once you have a clear understanding of the problem, you will be able to start working toward the solution.

  [Back to top](#faqs)

</details>


<details>
  <summary>I am unable to push changes to the repository. What should I do?</summary>
  <br>

There are a couple of possible reasons why you may be unable to *push* changes to a Git repository:

1. **You have not committed your changes:** Before you can push your changes to the repository, you need to commit them using the `git commit` command. Make sure you have committed your changes and try pushing again. To do this, run the following terminal commands from the project folder:
  ```bash
  git add .
  git commit -m "Your commit message"
  git push
  ```
2. **You do not have permission to push to the repository:** If you have cloned the repository directly from the main Ironhack repository without making a *Fork* first, you do not have write access to the repository.
To check which remote repository you have cloned, run the following terminal command from the project folder:
  ```bash
  git remote -v
  ```
If the link shown is the same as the main Ironhack repository, you will need to fork the repository to your GitHub account first and then clone your fork to your local machine to be able to push the changes.

**Note**: You should make a copy of your local code to avoid losing it in the process.

  [Back to top](#faqs)

</details>

