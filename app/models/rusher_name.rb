class RusherName < ApplicationRecord
  belongs_to :rusher

  validates_presence_of :rusher, :name, :ordinal

  before_save ->{
    self.index_name = name.downcase
  }

  scope :names, ->(*n) {
    n = n.flatten.compact.uniq.map{|n| n.downcase}

    n.any? ? where(table_name => {index_name: n}) : none
  }
end
