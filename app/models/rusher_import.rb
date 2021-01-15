require 'digest'
class RusherImport

  def self.process!(file, version: nil)

    sha256 = Digest::SHA256.hexdigest(File.open(file).read)

    version ||= sha256

    rusher_version = RusherVersion.create!({
      started_at: DateTime.now,
      sha256: sha256,
      version: version
    })

    File.open(file) do |f|

      begin
        JSON.parse(f.read).each do |entry|
          process_entry(entry, rusher_version)
        end
      rescue Exception => e
        rusher_version.error_at = DateTime.now
        rusher_version.result = e.message
      else
        rusher_version.complted_at = DateTime.now
      end
      rusher_version.save!
    end

    rusher_version
 end

 def self.process_entry(entry, version)
   lng = entry["Lng"]
   lng = lng.match(/^(-?\d+)/)[1].to_i if lng.kind_of?(String)

   Rusher.create!({
     rusher_version: version,
     names: entry["Player"],
     team: entry["Team"],
     pos: entry["Pos"],
     att: entry["Att"],
     att_g: entry["Att/G"],
     yds: entry["Yds"],
     avg: entry["Avg"],
     yds_g: entry["Yds/G"],
     td: entry["TD"] || 0,
     lng: lng,
     first_downs: entry["1st"],
     first_down_p: entry["1st%"],
     plus_20: entry["20+"],
     plus_40: entry["40+"],
     fumbles: entry["FUM"],
   })

 end

end
