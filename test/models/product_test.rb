# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  description        :string
#  name               :string
#  price_retail_cents :decimal(, )
#  product_category   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
