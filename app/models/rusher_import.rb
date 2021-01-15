class RusherImport < ApplicationRecord

  def self.process!(file, version: DateTime.now.to_s)

    File.open(file) do |f|
      byebug

      rusher_import_process = RusherImport.create!({
        start_at: DateTime.now,
        import_path: file
      })

      version = RusherVersion.create({
        version: version,
        rusher_import: rusher_import
      })

      JSON.parse(file)
    end
    
 end

end
