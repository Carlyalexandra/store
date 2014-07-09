class AddFullNameToCards < ActiveRecord::Migration
  def change
    add_column :cards, :full_name, :string
  end
end
