class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :amount
      t.string :title

      t.timestamps
    end
  end
end
