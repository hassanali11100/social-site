require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end
  
  test "should save a valid comment" do
    @validComment = Comment.new({content: @comment.content, username: @comment.username, post_id: @post.id})
    assert @validComment.save
  end

  test "should not save an invalid comment" do
    @invalidComment = Comment.new({username: @comment.username, post_id: @post.id})
    assert_not @invalidComment.save
  end
end
