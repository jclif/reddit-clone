class LinkSub < ActiveRecord::Base

  attr_accessible :sub_id, :link_id

  validates_presence_of :sub_id, :link_id
  validates_uniqueness_of :sub_id, scope: :link_id

  belongs_to :link,
  class_name: "Link",
  foreign_key: :link_id,
  primary_key: :id

  belongs_to :sub,
  class_name: "Sub",
  foreign_key: :sub_id,
  primary_key: :id

end
