class AddCityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :city, :string, null: false
  end
end
