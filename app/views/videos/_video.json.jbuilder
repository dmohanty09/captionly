json.extract! video, :id, :web_id, :playlist_id, :created_at, :updated_at
json.url video_url(video, format: :json)
