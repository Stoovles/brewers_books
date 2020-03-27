class BlurbSerializer
  include FastJsonapi::ObjectSerializer
  attributes :summary

  attribute :comments do |object|
    object.comments.as_json
  end
end
