class Link < ActiveRecord::Base

  attr_accessible :user_id, :title, :url, :body

  validates_presence_of :user_id, :title, :url

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :linksubs,
  class_name: "LinkSub",
  foreign_key: :link_id,
  primary_key: :id

  has_many :subs, through: :linksubs, source: :sub

end
