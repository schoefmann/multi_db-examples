class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.integer :views, :default => 0
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
