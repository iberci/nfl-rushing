class CreateRusherVersions < ActiveRecord::Migration[6.1]
  def change

    execute "delete from rushers"
    create_table :rusher_imports do |t|
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :error_at
      t.text :result
      t.string :import_path
    end

    create_table :rusher_versions do |t|
      t.string :version, null: false
      t.timestamps
      t.references :rusher_import 
    end

    add_column :rushers, :rusher_version_id, :bigint, null: false 

    add_foreign_key :rushers, :rusher_versions
  end
end
