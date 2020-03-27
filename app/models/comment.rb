class Comment < ApplicationRecord
  belongs_to :blurb
  belongs_to :user
end
