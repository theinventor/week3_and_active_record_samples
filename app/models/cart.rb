# == Schema Information
#
# Table name: carts
#
#  id             :bigint           not null, primary key
#  checked_out_at :datetime
#  uuid           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Cart < ApplicationRecord
end
