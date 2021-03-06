# == Schema Information
#
# Table name: cart_entries
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_cart_entries_on_cart_id     (cart_id)
#  index_cart_entries_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
require "test_helper"

class CartEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
