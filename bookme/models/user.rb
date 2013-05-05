class User < ActiveRecord::Base
  has_many :bookmarks
  validates_presence_of :name
end
