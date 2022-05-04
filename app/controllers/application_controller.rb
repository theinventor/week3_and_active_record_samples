class ApplicationController < ActionController::Base
  # before_action :add_fake_delay

  before_action :setup_cart

  def setup_cart
    if current_user
      @cart = Cart.cart_for_user(user_id: current_user.id)
      # we should see if they have a guest cookie we need to merge the cart we found by the user!
      if cookies[:cool_shopping_cart].present? && @cart.uuid != cookies[:cool_shopping_cart]
        puts "they are a user and have a non-matching uuid, lets check for a merge"
        guest_cart = Cart.guest_cart_from_uuid(uuid: cookies[:cool_shopping_cart])
        guest_cart.cart_entries.each do |guest_entry|
          puts "merging #{guest_entry.product.name} into logged in cart"
          @cart.cart_entries.create product: guest_entry.product, quantity: guest_entry.quantity
        end
        puts "done merging"
      end


      # pop a cookie in for this cart
      cookies.permanent[:cool_shopping_cart] = @cart.uuid
    else
      if cookies[:cool_shopping_cart].present?
        puts "they have a cart cookie"
        if @cart = Cart.guest_cart_from_uuid(uuid: cookies[:cool_shopping_cart])
          puts "good guest cart"
        else
          puts "needed to  make a new guest cart - their id was probably invalid"
          @cart = Cart.create
          cookies.permanent[:cool_shopping_cart] = @cart.uuid
        end
      else
        puts "no cookie, lets make a cart for a guest"
        @cart = Cart.create
        cookies.permanent[:cool_shopping_cart] = @cart.uuid
      end
    end
  end


  def add_fake_delay
    sleep(rand(1.5..3.5))
  end
end
