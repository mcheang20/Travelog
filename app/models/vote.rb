class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

   validates :user, presence: true
   validates :value, inclusion: { in: [1], message: "%{value} is not a valid vote." }, presence: true
end
