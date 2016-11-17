class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def about
  end

  def feature
  end

  def contact
  end
end
