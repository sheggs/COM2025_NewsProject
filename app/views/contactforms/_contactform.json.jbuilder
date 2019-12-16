json.extract! contactform, :id, :title, :body, :email, :created_at, :updated_at
json.url contactform_url(contactform, format: :json)
