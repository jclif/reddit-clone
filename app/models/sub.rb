class Sub < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates_uniqueness_of :name
  validates_presence_of :name, :user_id

  belongs_to :mod,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :linksubs,
  class_name: "LinkSub",
  foreign_key: :sub_id,
  primary_key: :id

  has_many :links, through: :linksubs, source: :link

end
