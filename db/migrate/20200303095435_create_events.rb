class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.string :location
      t.string :picture
      t.integer :seats
      t.string :speakers

      t.timestamps
    end
  end
end
