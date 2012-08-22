class CreateSubscriptionsSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscriptions_subscribers, :id => false do |t|
      t.integer :tag_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :subscriptions_subscribers
  end
end
