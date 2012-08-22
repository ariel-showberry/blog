class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts, :uniq => true

  #has_and_belongs_to_many :users, :as => :subscriptions
  
  has_and_belongs_to_many :subscribers, {:class_name=>'User', :join_table => 'subscriptions_subscribers'}
  #has_and_belongs_to_many :users, {:as => :subscribers, :class_name=>'User'}

  #has_and_belongs_to_many :users
end
