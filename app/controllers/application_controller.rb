class ApplicationController < ActionController::Base
  # before_action :add_fake_delay

  before_action :setup_cart

  def setup_cart
    if current_user
      @cart = Cart.cart_for_user(user_id: current_user.id)
      cookies[:cool_shopping_cart] = @cart.uuid
    else
      if cookies[:cool_shopping_cart].present?
        puts "they have a cart cookie"
        if @cart = Cart.their_cart_still_good?(uuid: cookies[:cool_shopping_cart])
          puts "good guest cart"
        else
          puts "needed to  make a new guest cart - their id was probably invalid"
          @cart = Cart.create
          cookies[:cool_shopping_cart] = @cart.uuid
        end
      else
        puts "no cookie, lets make a cart for a guest"
        @cart = Cart.create
        cookies[:cool_shopping_cart] = @cart.uuid
      end
    end
  end


  def add_fake_delay
    sleep(rand(1.5..3.5))
  end
end
