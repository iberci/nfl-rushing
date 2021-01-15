class Rusher < ApplicationRecord
  belongs_to :rusher_version

  has_many :rusher_names, ->{
    order("rusher_names.ordinal")
  }, dependent: :destroy

  validates_presence_of :team, :pos, :rusher_version

  def names=(*n)
    self.rusher_names = n.flatten.compact.map do |name|
      name.split /[,\s]+/
    end.flatten.compact.uniq.map.with_index do |name, ordinal|
      RusherName.new({
        name: name,
        ordinal: ordinal,
        rusher: self
      })
    end
  end

  def names
    self.rusher_names.map(&:name).join(" ")
  end

  scope :names, ->(*n) {
    joins(:rusher_names).merge(RusherName.names(*n))
  }
end
