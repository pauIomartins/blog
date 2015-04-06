class User < ActiveRecord::Base
  has_one :profile
  has_many :articles, -> { order "posted_on" }, :dependent => :nullify
end