class Topic
  include Mongoid::Document

  field :name, :type => String
  field :content, :type => String
  field :user_id, :type => Integer

  validates_presence_of :name, :content, :user_id

  belongs_to :user
end
