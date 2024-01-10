game <- function() {
    name <- readline("Enter your name:")
    print(paste("Welcome to the Rock, Paper, Scissor Game,", name))
    print("Type your input...")
    print("...R => Rock...")
    print("...P => Paper...")
    print("...S => Scissor...")
    choices <- c("R","P","S")
    p_score <- 0
    c_score <- 0
    n <- 1

    while (p_score != 3 && c_score != 3) {
    print(paste("!!!!--------Round",n,"--------!!!!"))
    flush.console()
    p_c <- toupper(readline("You play: "))
    while (p_c != "R" && p_c != "P" && p_c != "S"){
        print("!!..Unknown Input..!!")
        print("Please type input again!!")
        flush.console()
        p_c <- toupper(readline("You play:"))
    }
    c_c <- sample(choices, 1)
    p_cc <- switch(p_c, "R" = "Rock",
                        "P" = "Paper",
                        "S" = "Scissor")
    c_cc <- switch(c_c, "R" = "Rock",
                        "P" = "Paper",
                        "S" = "Scissor")


    if (p_c == c_c){
        print("Draw")
    } else if (p_c == "R" && c_c == "S" ||
                p_c == "P" && c_c == "R" ||
                p_c == "S" && c_c == "P") {
        print("Win")
        p_score = p_score + 1
    } else {
        print("Lose")
        c_score = c_score + 1
        }
        print(paste("You played", p_cc, "against", c_cc))
        print(paste("----- Current score..", p_score, ":", c_score,"-----"))
        n = n + 1
        flush.console()
    }

    if(p_score == 3){
        print("!!!Congrats..YOU WIN!!!")
    } else {
        print("..Better luck next time..")
    }

}

game()
again <- toupper(readline("Do you want to go again?? (Y/N): "))
while (again == "Y") {
    game()
    flush.console()
    again <- toupper(readline("Do you want to go again?? (Y/N): "))
}
