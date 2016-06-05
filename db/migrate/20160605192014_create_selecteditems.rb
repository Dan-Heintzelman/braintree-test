class CreateSelecteditems < ActiveRecord::Migration
  def change
    create_table :selecteditems do |t|
      t.references :user
      t.references :product
    end
  end
end
