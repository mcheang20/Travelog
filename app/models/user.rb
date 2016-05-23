class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  enum role: [:standard, :premium, :admin]

  has_many :wikis, through: :collaborators, dependent: :destroy
  has_many :collaborators
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def downgrade
    wikis = self.wikis.where(public: false)
    wikis.each do |wiki|
      wiki.update_attribute(:public, true)
    end
  end
end
