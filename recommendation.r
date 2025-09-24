# Load required libraries
library(recommenderlab)
library(dplyr)
library(ggplot2)

# Load the MovieLense dataset
data("MovieLense")

# Explore the dataset
summary(MovieLense)

# Convert the dataset to a data frame for easier manipulation
ml_df <- as(MovieLense, "data.frame")
head(ml_df)
str(ml_df)
# Check for missing values
sum(is.na(ml_df))
# Visualize the distribution of ratings
ggplot(ml_df, aes(x = rating)) +
  geom_bar(fill = "blue", alpha = 0.7) +
  labs(title = "Distribution of Movie Ratings", x = "Rating", y = "Count")

# Create a user-item rating matrix
rating_matrix <- as(MovieLense, "realRatingMatrix")

# Normalize the ratings
rating_matrix_norm <- normalize(rating_matrix)

# Create a training and test set