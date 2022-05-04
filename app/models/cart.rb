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

  belongs_to :user, optional: true
  has_many :cart_entries

  before_validation :setup_uuid

  def self.cart_for_user(user_id: )
    puts "called create for user #{user_id}"
    find_sole_by(user_id: user_id, checked_out_at: nil) rescue Cart.create(user_id: user_id)
  end

  def self.guest_cart_from_uuid(uuid: )
    find_by(uuid: uuid, checked_out_at: nil)
  end

  def setup_uuid
    uuid || self.uuid = SecureRandom.uuid
  end
end
