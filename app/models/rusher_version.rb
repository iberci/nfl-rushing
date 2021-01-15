class RusherVersion < ApplicationRecord
  validates_presence_of :version, :import_path

  STATES = {
    initial: {
      title: "Initial"
    },
    processing: {
      title: "Processing"
    },
    processed: {
      title: "Success"
    },
    error: {
    }
  }

  def self.process!(when: DateTime.now, file: path)

    
  end

end
