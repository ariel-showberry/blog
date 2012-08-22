class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, :polymorphic => {:default => 'User'}
      t.references :tag
      t.references :suggested_tag

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
