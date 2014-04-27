helpers do


  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

#-----------------BASED ON SESSION ID-----------------

  def current_round
    Round.where("user_id = #{current_user.id}").last
  end

  def current_deck
    current_round.deck
  end

  def current_guess
    current_round.guesses.last
  end

  # def current_deck_of_cards
  #   current_deck.cards
  # end





end

