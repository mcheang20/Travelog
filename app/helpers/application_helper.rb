module ApplicationHelper
  def markdown(text)
     options = {
       filter_html:     true,
       hard_wrap:       true,
       space_after_headers: true
     }

     extensions = {
       autolink:           true,
       superscript:        true,
       disable_indented_code_blocks: true
     }

     renderer = Redcarpet::Render::HTML.new(options)
     markdown = Redcarpet::Markdown.new(renderer, extensions)
     markdown.render(text).html_safe
    end


    def recent
      @wikis = Wiki.all.order('created_at DESC')
    end

    def all
     @wikis = Wiki.all
   end

   def followed
      @wikis = Wiki.followed_users(current_user.following).order('created_at DESC')
   end
 end
