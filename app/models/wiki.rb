class Wiki < ActiveRecord::Base

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "1200x500#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  belongs_to :category
  has_many :users, through: :collaborators
  has_many :comments, dependent: :destroy
  has_many :collaborators
  has_many :pics, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :category, presence: true
  validates :user, presence: true

  def likes_ups
   votes.where(value: 1).count
 end


 def likes
   votes.sum(:value)
 end
end
