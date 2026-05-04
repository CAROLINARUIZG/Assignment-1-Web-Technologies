class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string   :title,        null: false
      t.text     :description
      t.datetime :start_date,   null: false
      t.datetime :end_date,     null: false
      t.integer  :max_capacity, null: false
      t.integer  :status,       default: 0, null: false
      t.references :organizer,  null: false, foreign_key: { to_table: :users }
      t.references :category,   null: false, foreign_key: true
      t.references :location,   null: false, foreign_key: true

      t.timestamps
    end
  end
end