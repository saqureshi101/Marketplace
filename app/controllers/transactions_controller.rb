class TransactionsController< ApplicationController
	def create
		game = Game.find_by!(slug: params[:slug])
		sale = game.sales.create(
			amount: game.price, 
			buyer_email: current_user.email, 
			seller_email: game.user.email, 
			stripe_token: params[:stripeToken])
		sale.process!
			
		if sale.finished?
			redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
		else
			redirect_to game_path(game), notice: "Something went wrong"
		end
	end


	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@game = @sale.game
	end
end