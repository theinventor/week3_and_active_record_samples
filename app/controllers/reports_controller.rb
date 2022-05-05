class ReportsController < ApplicationController
  def main

  end

  def tax
    respond_to do |format|
      format.html {}
      format.csv {send_data Cart.to_csv, filename: "trips-#{Date.today}.csv"}
    end
  end
end
