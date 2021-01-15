class CreateRushers < ActiveRecord::Migration[6.1]
  def change

    create_table :rushers do |t|
      t.string :team, null: false
      t.string :pos, null: false
      t.integer :att, null: false, default: 0
      t.integer :att_g, null: false, default: 0.0
      t.integer :yds, null: false, default: 0
      t.float :avg, null: false, default: 0
      t.float :yds_g, null: false, default: 0.0
      t.integer :td, null: false, default: 0
      t.integer :lng, null: false, default: 0
      t.integer :first_downs, null: false, default: 0
      t.float :first_down_p, null: false, default: 0.0
      t.integer :plus_20, null: false, default: 0
      t.integer :plus_40, null: false, default: 0
      t.integer :fumbles, null: false, default: 0

      t.timestamps
    end

    create_table :rusher_names do |t|
      t.integer :ordinal, null: false, default: 0
      t.string :name, null: false
      t.string :index_name, null: false
      t.references :rusher, on_delete: :cascade
    end

    add_index :rusher_names, :index_name

  end
end
