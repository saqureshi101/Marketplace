class Sale < ActiveRecord::Base

	before_create :populate_guid
	belongs_to :game


def charge_card
		begin
			save!
			charge = Stripe::Charge.create(
				amount: self.amount,
				currency: "usd",
				card: self.stripe_token,
				description: "Game Sale"
				)
			self.update(stripe_id: charge.id)
			self.finish!
		rescue Stripe::StripeError => e
			self.update_attributes(error: e.message)
			self.fail!
		end
	end

	private 

		def populate_guid
			self.guid = SecureRandom.uuid()
		end
end
