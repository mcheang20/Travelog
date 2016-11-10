class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:standard, :premium, :admin]
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100!", large: "1200x500#"}, default_url: "http://istc-pc-test-media.cs.washington.edu/images/default-profile-pic.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :wikis, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :collaborators
  has_many :votes, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def downgrade
    wikis = self.wikis.where(public: false)
    wikis.each do |wiki|
      wiki.update_attribute(:public, true)
    end
  end

  def like_for(wiki)
    votes.where(wiki_id: wiki.id).first
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
