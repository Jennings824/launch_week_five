class Comment < ActiveRecord::base
  validates :description, presence: true, length {max: 140}
end
