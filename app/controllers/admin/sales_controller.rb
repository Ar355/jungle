class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.all
  binding.pry
  end


end
