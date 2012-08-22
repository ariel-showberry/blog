class Post < ActiveRecord::Base
  validates_presence_of :content, :title
  validates_length_of :title, :minimum => 5
  has_and_belongs_to_many :tags, :uniq => true

  #belongs_to :author, :polymorphic => true
  belongs_to :author, :class_name=>'User'

end
