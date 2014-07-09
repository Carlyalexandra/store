class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :user, index: true
      t.integer :card_number
      t.integer :security_code
      t.integer :zipcode

      t.timestamps
    end
  end
end
