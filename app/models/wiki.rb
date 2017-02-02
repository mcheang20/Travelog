class Wiki < ActiveRecord::Base
  is_impressionable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", index: "350x300#", large: "1200x800#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :collaborators
  has_many :pics, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :description, presence: true
  validates :category, presence: true

    def likes_ups
     votes.where(value: 1).count
    end

   def likes
     votes.sum(:value)
   end

   def most_popular
     votes.likes > 1
   end
   # search method for development env use LIKE
   # for production use ILIKE
   def self.search(search)
      where("title ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
   end

   scope :followed_users, -> (following_users) { where user_id: following_users }
   scope :your_likes, -> (user) { where wiki_id: current_user.vote }
end
