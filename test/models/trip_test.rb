# == Schema Information
#
# Table name: trips
#
#  id               :bigint           not null, primary key
#  arrival_date     :date
#  departure_date   :date
#  destination_city :string
#  lattitude        :decimal(15, 10)
#  longitude        :decimal(15, 10)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
