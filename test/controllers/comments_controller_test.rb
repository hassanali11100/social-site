require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should get new" do
    get new_post_comment_url(@post)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(@post), params: { comment: { content: @comment.content, username: @comment.username } }
    end
  end

  test "should like comment" do
    assert_difference('Comment.find(@comment.id).like_count', 1) do
      patch like_post_comment_url(@post, @comment)
    end
  end
end
