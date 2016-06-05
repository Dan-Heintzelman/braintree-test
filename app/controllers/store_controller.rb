class StoreController < ActionController::Base

  def index
    @items = Item.all
  end

end
