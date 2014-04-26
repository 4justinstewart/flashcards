
User.create(first_name: "deck", last_name: "creator", email: "deck_creator@email.com", password: "password")

User.create(first_name: "round", last_name: "player", email: "round_player@email.com", password: "password")

# Deck.create(name: "colors", user_id: "1")

# Card.create(question: "sky color?", answer: "blue", deck_id: "1")
# Card.create(question: "grass color?", answer: "green", deck_id: "1")
# Card.create(question: "school bus color?", answer: "yellow", deck_id: "1")

# Round.create(user_id: "2", deck_id: "1")

# Guess.create(word: "blue", correct: true, round_id: "1", card_id: "1")
# Guess.create(word: "black", correct: false, round_id: "1", card_id: "2")
# Guess.create(word: "red", correct: false, round_id: "1", card_id: "3")









#Rohan-Stats (New seed file stuff for testing)

# Round.create(user_id: 2, deck_id: 1) #Created a new round with the same deck (deck 1)

#These are the guesses for the round
# Guess.create(word: "white", correct: false, round_id: "2", card_id: "1")
# Guess.create(word: "white", correct: false, round_id: "2", card_id: "2")
# Guess.create(word: "yellow", correct: true, round_id: "2", card_id: "3")

#-------------------------------------------Create a new deck with user_id as the creator AND the player

# Deck.create(name: "Pokemon", user_id: 2)

# Card.create(question: "Ash's favorite one; yellow; lightning type.", answer: "pikachu", deck_id: "2")
# Card.create(question: "Blue water type; final type is Blastoise", answer: "squirtle", deck_id: "2")
# Card.create(question: "Best pokemon. Fire-breathing-grass-burning-dragon.", answer: "charzard", deck_id: "2")

# Round.create(user_id: "2", deck_id: "2")

# Guess.create(word: "pikachu", correct: true, round_id: "3", card_id: "4")
# Guess.create(word: "squirtle", correct: true, round_id: "3", card_id: "5")
# Guess.create(word: "godzilla", correct: false, round_id: "3", card_id: "6")
