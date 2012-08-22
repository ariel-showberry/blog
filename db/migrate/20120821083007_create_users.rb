class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password
      t.references :post
      t.references :tag
      t.references :suggested_tag
      t.references :subscription, :polymorphic => {:default => 'Tag'}
      t.datetime :last_visit

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
