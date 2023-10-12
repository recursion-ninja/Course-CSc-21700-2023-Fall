### ###
# Objects of interest
### ###

car  <- 'Car!' # Valuable and desired car
goat <- 'Goat' # Cute, but but undesired goat(s)
doorLabels <- c(1, 2, 3)
doorPrizes <- c(car, goat, goat)

### ###
# Decision Procedures
### ###

Always_Select_Door <- function(n) {
    constantChoice <- function () {
        return(n)
    }
    return(constantChoice)
}

Randomly_Select_Door <- function() {
    randomChoice <- function() {
        return(sample(doorLabels, 1))
    }
    return(randomChoice)
}

Always_Respond_With <- function(decision) {
    constantResponse <- function () {
        return(decision)
    }
    return(constantResponse)
}

Randomly_Respond <- function() {
    randomResponse <- function() {
        return(sample(c(FALSE,TRUE), 1))
    }
    return(randomResponse)
}

### ###
# Internal functions
### ###

distribute_prizes <- function() {
    randomizedDoors <- c(goat,goat,goat)
    carDoor <- sample(doorLabels,1)
    randomizedDoors[carDoor] <- car
#    randomizedDoors <- sample(doorLabels,1)
    names(randomizedDoors) <- doorLabels
    return(randomizedDoors)
}

doors = c(goat,goat,car)
chosen = 3
monty_halls_offer <- function(doors, chosen) {
#    print(doors)
    otherDoors <- doors[setdiff(names(doors), chosen)]
#    message("Other Doors:")
#    print(otherDoors)
    goatDoors <- otherDoors[-(which(otherDoors %in% car ))]
    if (length(goatDoors) == 0) {
        goatDoors <- otherDoors
    }
#    message("Goat Doors:")
#    print(goatDoors)
#    message()
    openedDoor <- names(sample(goatDoors, 1))
    offeredDoor <- names(otherDoors[setdiff(names(otherDoors), openedDoor)])
#    message(sprintf("Chosen:\t%s\nOpenned\t%s\nOffered:\t%s\n", chosen, openedDoor, offeredDoor))
    return(offeredDoor)
}

reveal_selected_prize <- function(doors, chosen, offered) {
    outcome <- function(switchDoors) {
        prize <- doors[chosen]
        if (switchDoors) {
            prize <- doors[offered]
        } 
        return(prize)
    }
    return(outcome)
}

Monty_Halls_Game <- function(chosenDoor) {
    randomizedDoors <- distribute_prizes()
    offeredDoor <- monty_halls_offer(randomizedDoors, chosenDoor)
    decision <- reveal_selected_prize(randomizedDoors, chosenDoor, offeredDoor)
    return(decision)
}

### ###
# Monty Hall's "Lets Make a Deal" simulation
### ###

Play_Game_With_Decisions <- function(choice_one, choice_two) {
    selectedDoor <- choice_one()
#    print(sprintf("Selecting door: %d", selectedDoor))
    swapQuestion <- Monty_Halls_Game( selectedDoor )
    swapResponse <- choice_two()
#    print(sprintf("Will switch doors: %d", swapResponse))
    prizeOutcome <- swapQuestion( swapResponse )
#    print(sprintf("Received prize of: %s", prizeOutcome))
    return(prizeOutcome)
}

### ###
# Your Code Goes Here
### ###

how_to_choose_door <- Randomly_Select_Door()
how_to_choose_swap <- Randomly_Respond()

N <- 1000
outcomes <- replicate(N, Play_Game_With_Decisions(how_to_choose_door, how_to_choose_swap))
df <- as.data.frame(table(outcomes))
barplot(df$Freq,
        main="Distribution",
        xlab="Outcome", 
        ylab="Occurrences", ylim = c(0, N),
        width = c(1,1),
        xlim =c(0,5),
        space=1,
        names.arg = df$outcomes,
        col = c("skyblue", "pink"),
        border = c("dodgerblue3", "hotpink"))

print(df)
