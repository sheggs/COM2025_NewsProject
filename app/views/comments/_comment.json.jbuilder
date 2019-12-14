json.extract! comment, :id, :comment, :user_id, :post_id, :likes, :created_at, :updated_at
json.url comment_url(comment, format: :json)
