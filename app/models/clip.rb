class Clip < ActiveRecord::Base
  belongs_to :wiki
  has_attached_file :video, styles: {
        :medium => {
          :geometry => "1200x800",
          :format => 'mp4'
        },
        :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end
