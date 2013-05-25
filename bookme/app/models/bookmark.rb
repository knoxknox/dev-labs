class Bookmark < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :url, :title
  validates :url, :inclusion => [:http, :https]
end
