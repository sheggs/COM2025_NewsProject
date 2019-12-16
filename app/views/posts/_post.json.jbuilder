json.extract! post, :id, :body, :user_id, :title, :important, :summary, :comment_enabled, :created_at, :updated_at
json.url post_url(post, format: :json)
