  User.create(first_name: "deck", last_name: "creator", email: "deck_creator@email.com", password: "password")

User.create(first_name: "round", last_name: "player", email: "round_player@email.com", password: "password")

Deck.create(name: "colors", user_id: "1")

Card.create(question: "sky color?", answer: "blue", deck_id: "1")
Card.create(question: "grass color?", answer: "green", deck_id: "1")
Card.create(question: "school bus color?", answer: "yellow", deck_id: "1")

Round.create(user_id: "2", deck_id: "1")

Guess.create(word: "blue", correct: true, round_id: "1", card_id: "1")
Guess.create(word: "black", correct: false, round_id: "1", card_id: "2")
Guess.create(word: "red", correct: false, round_id: "1", card_id: "3")
