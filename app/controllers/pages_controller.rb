class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  	 if current_user 
        redirect_to games_path
      end
  end

  def dashboard
  	 @games = current_user.games
  end
  
end
