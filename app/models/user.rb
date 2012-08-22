class User < ActiveRecord::Base
  #has_many :posts , :polymorphic => true
  #
  has_many :posts ,:as => :author

  #has_and_belongs_to_many :tags, :as => :subscribers
  
  has_and_belongs_to_many :subscriptions, {:class_name=>'Tag', :join_table => 'subscriptions_subscribers'}
  #has_and_belongs_to_many :tags, {:as => :subscriptions, :class_name=>'Tag'}

  #has_many :suggested_tags
  #has_many :subscriptions
end
