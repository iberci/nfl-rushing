class RusherVersion < ApplicationRecord
  validates_presence_of :version, :sha256

  scope :started, ->{
    where.not(table_name => {started_at: nil}).where(table_name =>{completed_at: nil}).where(table_name =>{error_at: nil})
  }

  scope :completed, ->{
    where.not(table_name => {completed_at: nil})
  }

  scope :faulted, ->{
    where.not(table_name => {error_at: nil})
  }
end
