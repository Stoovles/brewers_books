class BlurbSerializer
  include FastJsonapi::ObjectSerializer
  attributes :summary

  #loops through all comments on each blurb object and returns the
  #array of comments in json
  attribute :comments do |object|
    object.comments.as_json
  end
end
