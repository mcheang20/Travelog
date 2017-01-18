class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def about
  end

  def guidelines
  end

  def contact
  end
end
