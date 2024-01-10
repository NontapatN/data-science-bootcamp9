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

chat_bot <- function(){

    again <- "Y"
    total <- c()
    print("Hello!! This is BB Pizza...!!!")

    while (again == "Y") {
    flush.console()
    ord <- tolower(readline("What do you want today?
    Set / Pizza / Appetizer / Drink?:"))

        if(ord == "set"){
            print(s)
            flush.console()
            set_ord <- readline("Which set do you want?? [1/2/3/4/5] : ")
            subset <- s[s$set_num == set_ord, ]
            print(paste("You have selected", subset$set_name))
            flush.console()

            set_n <- as.integer(readline("How many set??: "))
            total_price = subset$price * set_n
            total <- append(total, total_price)
            print(paste("That would be",total_price, "Baht"))
        } else if (ord == "pizza") {
            print(p)
            flush.console()
            p_ord <- readline("Which pizza do you want?? [1/2/3/4/5] : ")
            subset_1 <- p[p$p_id == p_ord, ]
            print(paste("You have selected", subset_1$p_name))
            flush.console()

            p_n <- as.integer(readline("How many pizza??: "))
            total_price = subset_1$price * p_n
            total <- append(total, total_price)
            print(paste("That would be",total_price, "Baht"))
        } else if (ord == "appetizer") {
            print(a)
            flush.console()
            a_ord <- readline("Which appetizer do you want?? [1/2/3] : ")
            subset_2 <- a[a$a_id == a_ord, ]
            print(paste("You have selected", subset_2$a_name))
            flush.console()

            a_n <- as.integer(readline("How many appetizer??: "))
            total_price = subset_2$price * a_n
            total <- append(total, total_price)
            print(paste("That would be",total_price, "Baht"))
        } else if (ord == "drink") {
            print(d)
            flush.console()
            d_ord <- readline("Which drink do you want?? [1/2/3] : ")
            subset_3 <- d[d$d_id == d_ord, ]
            print(paste("You have selected", subset_3$d_name))
            flush.console()

            d_n <- as.integer(readline("How many drink??: "))
            total_price = subset_3$price * d_n
            total <- append(total, total_price)
            print(paste("That would be",total_price, "Baht"))
        } else {
            print("Invalid Order")
            print("Please select again..")
        }
    flush.console()
    again <- readline("Do you want another orders?? [Y/N] : ")
    }
    print("===========================================================")
    print(paste("That's it..So, it totally costs you", sum(total), "Baht"))
    print("===========================================================")
    print("....Thank you for chosing BB Pizza....")
    21
}

chat_bot()
