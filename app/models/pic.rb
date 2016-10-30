class Pic < ActiveRecord::Base
  belongs_to :wiki
  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", album: "500x500"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
