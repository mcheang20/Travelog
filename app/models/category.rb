class Category < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
end
