## connect to PostgreSQL server
library(RPostgreSQL)
library(tidyverse)

## create connection
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "zncuavoe",
  user = "zncuavoe",
  password = "gdqvyw_R00BDxJWBWY-CBV36JkNFDDh8",
  port = 5432
)

## dbListTables(con)

## get data
## dbGetQuery(con, "select * from some_tables")

## HW02 - restaurant pizza
## create 3-5 dataframes => write table into server

s <- data.frame(
  set_num = 1:5,
  set_name = c("Party Bazinga",
               "Party Bazooga",
               "Party Bazungo",
               "Couple Luv",
               "IEATALOT"),
  contain = c("3 Signature BB / 2 Hawaiian / 4 Coke / 6 French Fries",
              "2 Hawaiian / 1 Seafood / 4 Coke / 4 French Fries",
              "1 Signature BB / 1 Seafood / 1 Extra Cheese / 2 Coke / 3 Donuts",
              "2 Signature BB / 2 Lemonade / 2 Nuggets",
              "1 Signature BB / 1 Tom Yam Kung / 1 Coke / 1 French Fries"),
  price = c(740, 590, 520, 320, 250)
)
p <- data.frame(
  p_id = 1:5,
  p_name = c("Signature BB",
             "Hawaiian",
             "Tom Yam Kung",
             "Seafood",
             "Extra Cheese"),
  price = c(160, 180, 165, 170, 170)
)
d <- data.frame(
  d_id = 1:3,
  d_name = c("Water", "Coke", "Lemonade"),
  price = c(20, 25, 25)
)
a <- data.frame(
  a_id = 1:3,
  a_name = c("French Fries" ,"Donut", "Nuggets"),
  price = c(30, 40, 40)
)

## Write table to database
dbWriteTable(con, "set", s)
dbWriteTable(con, "pizza", p)
dbWriteTable(con, "drink", d)
dbWriteTable(con, "appetizer", a)

## Ensure tables are available in databases
dbListTables(con)

## Get Table & View
set <- dbGetQuery(con, "select * from set")
pizza <- dbGetQuery(con, "select * from pizza")
drink <- dbGetQuery(con, "select * from drink")
appetizer <- dbGetQuery(con, "select * from appetizer")
view(set)
view(pizza)
view(drink)
view(appetizer)
