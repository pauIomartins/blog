class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true,
                   length: { minimum: 140 }
                   
  belongs_to :user
  has_and_belongs_to_many :categories
end