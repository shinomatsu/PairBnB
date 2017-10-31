class BraintreeController < ApplicationController
	
  def new
  	@client_token = Braintree::ClientToken.generate
  	@booking = Booking.find(params[:id])
  end

  def checkout

  @booking = Booking.find(params[:id])
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   #:amount => "10.00", #this is currently hardcoded??
   :amount => @booking.total_price, #this is currently hardcoded??
   :payment_method_nonce => 'fake-valid-visa-nonce', #this line is change at testing
   :options => {
      :submit_for_settlement => true  #true is success 
    }
   )

  

  if result.success?
    # byebug
    @booking.update(pay_status: true)
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
  
end

end


