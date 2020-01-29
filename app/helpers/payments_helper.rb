module PaymentsHelper
  def get_card_info
    payment = UserPayment.where(user_id: current_user.id).first
    if payment.present?
      payjp_setting
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_info = customer.cards.retrieve(payment.card_id)
      case @card_info.brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def payjp_setting
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
  end

end
