# Overview

This project was created to explore the R programming language and its practical applications in building intelligent, data-driven systems. As part of my journey as a software engineer, I wanted to deepen my understanding of R’s syntax, data manipulation capabilities, and statistical modeling tools by developing a working movie recommendation system.

The software uses collaborative filtering techniques to generate personalized movie recommendations based on user ratings. It leverages the **MovieLense** dataset and the **`recommenderlab`** package to analyze similarities between users and suggest new movies that align with the user’s preferences.  
The program reads and writes CSV files to persist user data, removes previously rated movies, and interactively collects new ratings to refine future recommendations.

The purpose of this project is to:
- Gain practical experience with R syntax and data structures.
- Learn how to process and transform datasets programmatically.
- Apply a real-world use case (recommendation systems) using R’s libraries.
- Work with CSV files and build a simple user feedback loop.

This program is a **Recommendation System** based on movie data.

[Software Demo Video](http://youtube.link.goes.here)

# Development Environment

R 4.5.1
VS Code

# Useful Websites

{Make a list of websites that you found helpful in this project}

- [W3 Schools](https://www.w3schools.com/r/r_get_started.asp)  
- [RStudio Documentation](https://www.rdocumentation.org/)  
- [Recommenderlab CRAN Page](https://cran.r-project.org/web/packages/recommenderlab/index.html)  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/r)  

# Future Work

- Display output to the screen more clearly with better formatting
- Adds more recomendation prompts with a movie is skipped 
- Ensure at least 5 different R datatypes are used effectively  
- Incorporate additional loops for enhanced interactivity  
- Improve dataframe usage for filtering movies by genre 
- Update Movie database with modern movies 
- Expand CSV file management for multiple users and sessions  
- Potentially add a graphical interface using Shiny for better UX 

# Update 9/23/2025 - Project Start

- Initialized R project in Visual Studio Code.  
- Installed **recommenderlab** and imported the **MovieLense** dataset.

# Update 9/26/25

- Implemented a simple recommendation model using **User-Based Collaborative Filtering (UBCF)**.

# Update 9/30/25

- Added interactive movie rating functionality to collect user input.  
- Displayed top movie recommendations to the console.

# Update 10/03/2025 — CSV Integration & Data Handling

- Added support for reading user ratings from a CSV file before prompting for new ratings.  
- Implemented logic to **filter out already rated movies** to avoid duplication.  
- Enhanced data handling using **dataframes** for merging and filtering operations.  
- Added functionality to **save new user ratings and recommendations** to a CSV file.  
- Cleaned up the recommendation display and improved console output.  
- Verified use of multiple R datatypes (vectors, lists, matrices, dataframes, factors).  


