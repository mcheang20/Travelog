class Pic < ActiveRecord::Base
  belongs_to :wiki
  has_attached_file :image, styles: { medium: "500x500", thumb: "100x100", album: "600x600", big: "1000x1000"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
