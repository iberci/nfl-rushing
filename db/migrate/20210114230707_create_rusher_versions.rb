class CreateRusherVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :rusher_versions do |t|
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :error_at
      t.text :result
      t.string :sha256
      t.string :version, null: false
      t.timestamps
    end

    add_column :rushers, :rusher_version_id, :bigint, after: :id, null: false 

    add_foreign_key :rushers, :rusher_versions, on_delete: :cascade
  end
end
