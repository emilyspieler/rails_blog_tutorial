class PagesController < ApplicationController
  def about
    @title = 'About us'
    @random = 'Here is where we can talk about us'
  end
end
