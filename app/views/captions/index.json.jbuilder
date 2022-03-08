# json.array! @captions, partial: "captions/caption", as: :caption
json.array! @captions do |caption|
 json.id caption.id
 json.text caption.text
 json.timestamp caption.timestamp
 json.video_web_id caption.video.web_id
 json.video_id caption.video.id
end