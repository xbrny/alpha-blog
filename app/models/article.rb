class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }

  belongs_to :user

end
