json.stories do
  json.array! @stories do |story|
    json.extract! story, :id, :title, :content
  end
end
json.extract! @story, :id, :name, :text
json.comments @story.comments do |comment|
  json.extract! comment, :id, :content, :name
  json.date comment.created_at.strftime("%m/%d/%y")
end
