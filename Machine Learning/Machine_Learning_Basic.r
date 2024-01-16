## Package to prep data
library(tidyverse)

## Package to train models
library(caret)

## preview data
df <- read_csv("churn.csv")
head(df)

## recap stats
model <- lm(mpg ~ hp + wt, data = mtcars)

## build standard interface for model training
model2 <- train(mpg ~ hp + wt,
                data = mtcars,
                method = "lm")


## Steps
## 1. split data

train_test_split <- function(data, size = 0.8) {
  set.seed(95)
  n <- nrow(data)
  train_id <- sample(1:n, size*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return( list(train_df, test_df))
}

prep_df <- train_test_split(df, size = 0.8)
prep_df[[1]]

## 2. train model

ctrl <- trainControl(method = "boot",
                     number = 25)

model <- train(churn ~ totaldayminutes + totaldaycharge + totaleveminutes + totalevecharge,
               data = prep_df[[1]],
               method = "glm",
               trControl = ctrl)


## 3. score model

pred_churn <- predict(model, newdata = prep_df[[2]])


## 4. evaluate model

actual_churn <- factor(prep_df[[2]]$churn)

## error = actual - prediction

matrix <- confusionMatrix(data = pred_churn, reference = actual_churn)

print(matrix)

