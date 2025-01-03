json.extract! account, :id, :name, :email, :login, :created_at, :updated_at
json.url account_url(account, format: :json)
