class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :city
      t.string :state
      t.text :comment

      t.timestamps
    end
  end
end
