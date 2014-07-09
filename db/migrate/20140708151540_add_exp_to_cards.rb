class AddExpToCards < ActiveRecord::Migration
  def change
    add_column :cards, :exp_month, :integer
    add_column :cards, :exp_year, :integer
  end
end
