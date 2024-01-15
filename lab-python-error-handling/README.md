![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB | Error Handling

<details>
  <summary>
   <h2>Learning Goals</h2>
  </summary>

  This exercise allows you to practice and apply the concepts and techniques taught in class. 

  Upon completion of this exercise, you will be able to:
  
- Implement error handling techniques in Python to handle and respond to runtime errors.
- Use the try-except-else-finally structure to handle exceptions gracefully and handle errors in a controlled manner.
- Raise exceptions when necessary to indicate that an error has occurred.
- Catch and handle specific exceptions using the except clause.
- Use multiple except clauses to handle different types of exceptions.
- Finally, you will be able to improve the robustness and reliability of your code by implementing appropriate error handling techniques.

  <br>
  <hr> 

</details>

<details>
  <summary>
   <h2>Prerequisites</h2>
  </summary>

Before this starting this lab, you should have learnt about:

- Data types, operators and structures
- Flow control (if-else statements and loops)
- Functions
- Error Handling: try, except, raise
 
  <br>
  <hr> 

</details>


## Introduction

Welcome to the Error Handling Lab! In this lab, you will practice how to handle errors in Python programs using the try-except-else-finally blocks, as well as how to raise your own exceptions. You will be given a series of functions to modify, and your task will be to add appropriate error handling to each function to ensure that the code runs smoothly and handles any possible errors that may occur. By the end of this lab, you will have gained practical experience in handling errors in Python and be better prepared to write robust, error-free code. 

**This lab builds upon the solution from the previous exercise and enhances it by incorporating error handling mechanisms to create more robust and improved code.**

Let's get started!
<br>

**Happy coding!** :heart:

## Important Notes

This lab is built on top of the `functions` lab. If you couldn't complete the `functions` lab, ask your TA for the `functions` lab solution so you can do this lab on top of it.

## Requirements

- Fork this repo
- Clone it to your machine


## Getting Started

Complete the challenges in the notebook. Follow the instructions and add your code and explanations as necessary.

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
