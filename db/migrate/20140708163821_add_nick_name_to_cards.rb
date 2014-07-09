class AddNickNameToCards < ActiveRecord::Migration
  def change
    add_column :cards, :nickname, :string
  end
end
