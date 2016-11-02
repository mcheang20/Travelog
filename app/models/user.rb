class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:standard, :premium, :admin]

  has_many :wikis, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :collaborators
  has_many :votes, dependent: :destroy
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
