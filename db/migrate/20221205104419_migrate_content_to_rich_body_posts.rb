class MigrateContentToRichBodyPosts < ActiveRecord::Migration[7.0]
  def up
    Post.find_each do |post|
      post.update(rich_body: post.content)
    end
  end

  def down
    Post.find_each do |post|
      post.update(content: post.rich_body)
      post.update(rich_body: nil)
    end
  end
end
