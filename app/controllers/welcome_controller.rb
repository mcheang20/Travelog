class WelcomeController < ApplicationController

  def home
  end

  def index
    @wikis = Wiki.all
  end

  def about
  end

  def learn_more
  end

  def guidelines
  end

  def contact
  end
end
