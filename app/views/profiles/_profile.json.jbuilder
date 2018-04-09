json.extract! profile, :id, :gender, :weight, :height, :date_of_birth, :created_at, :updated_at
json.url profile_url(profile, format: :json)
