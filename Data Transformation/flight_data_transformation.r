## HOMEWORK
## 5 questions for flights dataframe
library(nycflights13)

## Question 1: Which flight had longest air time in last quarter of 2013?

Q1 <- flights %>%
  inner_join(planes, by = "tailnum") %>%
  inner_join(airlines, by = "carrier") %>%
  select(name, year.x, month, day, manufacturer, model, air_time) %>%
  filter(!is.na(air_time) & between(month, 10, 12)) %>% 
  arrange(desc(air_time)) %>%
  slice(1)
  
## Question 2: Find top 5 month of largest numbers of flight.

Q2 <- flights %>%
  select(month) %>%
  group_by(month) %>%
  summarise(number_of_flights = n()) %>%
  arrange(desc(number_of_flights)) %>%
  slice(1:5)
  
## Question 3: Rank the airlines which has less average departure delay time.

Q3 <- flights %>%
  inner_join(airlines, by = "carrier") %>%
  inner_join(planes, by = "tailnum") %>%
  select(name, dep_delay) %>%
  filter(!is.na(dep_delay)) %>%
  mutate(dep_delay_v2 = if_else(dep_delay < 0, 0, dep_delay)) %>%
  group_by(name) %>%
  summarize(avg_delay = mean(dep_delay_v2)) %>%
  arrange(avg_delay)

## Question 4: Assumed all the planes is fully seated, which airline did carry the most passengers in December 2013?

Q4 <- flights %>%
  inner_join(airlines, by = "carrier") %>%
  inner_join(planes, by = "tailnum") %>%
  select(name, month, model, seats, tailnum) %>%
  filter(month == 12) %>%
  group_by(name,model,seats) %>%
  summarise(num = n()) %>%
  group_by(name, model) %>%
  summarise(pass_num = num*seats) %>%
  group_by(name) %>%
  summarise(sum_pass_num = sum(pass_num)) %>%
  arrange(desc(sum_pass_num))


## Question 5: How many flights did the American Airlines Inc. have which departed from JFK Airport to Miami International Airport in last quarter of 2013?

Q5 <- flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, name, month, origin, dest) %>%
  filter(carrier == "AA"  &
          between(month, 10, 12) &
          origin == "JFK" & dest == "MIA") %>%
  group_by(carrier, name, origin, dest) %>%
  summarise(num_flights = n())
  
  