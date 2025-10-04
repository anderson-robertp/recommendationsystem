# Load required libraries
library(recommenderlab)
library(dplyr)
library(ggplot2)

# Load the MovieLense dataset
data("MovieLense")

# Load or create user ratigs CSV
ratings_file <- "ratings.csv"

if (file.exists(ratings_file))  {
  starter_ratings <- data.frame(
    Movie = character(),
    Rating = numeric(),
    stringsAsFactors = FALSE
  )
  write.csv(starter_ratings, ratings_file, row.names = FALSE)
  cat("Created empty ratings.csv\n")
}

# Read user ratings from CSV
user_ratings_df <- read.csv(ratings_file, stringsAsFactors = FALSE)
print("Loaded user ratings from CSV:")

# Convert to named vector of already rated movies
already_rated <- user_ratings_df$Movie

# Load movies to rate and exclude already rated
movies_to_rate <- setdiff(colnames(MovieLense), already_rated)

# Interative rating
# Ask the User to rate a few movies
m_to_r <- sample(movies_to_rate, 5) # Randomly select 5 movies
user_ratings <- rep(NA, length(m_to_r))

for (i in 1:length(m_to_r)) {
  ans <- readline(prompt = paste("Rate", m_to_r[i], "(1-5, 0 to skip): "))
  ans <- as.numeric(ans)
  if (!is.na(ans) && ans >0) {
    user_ratings[i] <- ans
  }
}

# Collect only nonskipped ratings
rated_movies <- m_to_r[!is.na(user_ratings)]
rated_ratings <- user_ratings[!is.na(user_ratings)]

# Combine with existing ratings
new_entries <- data.frame(
  Movie = rated_movies,
  Rating = rated_ratings,
  stringsAsFactors = FALSE
)
user_ratings_df <- rbind(user_ratings_df, new_entries)

# Save updated ratings back to CSV
write.csv(user_ratings_df, ratings_file, row.names = FALSE)

# Prep user ratings vector
user_ratings_vector <- setNames(user_ratings_df$Rating, user_ratings_df$Movie)

# Create a new user rating matrix
new_user <- rep(NA, ncol(MovieLense))
names(new_user) <- colnames(MovieLense)
new_user[names(user_ratings_vector)] <- user_ratings_vector

#Convert to realRatingMatrix
new_user <- matrix(new_user, nrow = 1,
                   dimnames = list(user = "new_user",
                                   items = colnames(MovieLense)))

# Coerce to realRatingMatrix
new_user_matrix <- as(new_user, "realRatingMatrix")

# Train a recommender model using UBCF
recommender_model <- Recommender(MovieLense, method = "UBCF")

# Predict top 10 movie recommendations for the new user
predictions <- predict(recommender_model, new_user_matrix, n = 10)

# Get the recommended movie titles
recommended_movies <- as(predictions, "list")[[1]]

# Print the recommended movies
cat("Recommended Movies:\n")
print(recommended_movies)