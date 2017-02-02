class Pic < ActiveRecord::Base
  belongs_to :wiki
  has_attached_file :image, styles: { medium: "400x400", thumb: "100x100", album: "600x600", big: "800x800"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
