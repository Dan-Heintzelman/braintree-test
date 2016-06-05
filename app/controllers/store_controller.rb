class StoreController < ApplicationController::Base

  def index
    @items = Items.all
    
  end
end
