class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  	 if current_user 
        redirect_to games_path
      end
      @games = Game.last(4)
  end

  def dashboard
  	 @games = current_user.games
  	 @purchased = Sale.where(buyer_email: current_user.email)
  	 @sales = Sale.where(seller_email: current_user.email)
  end
  
end
