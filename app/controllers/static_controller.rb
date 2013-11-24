class StaticController < ApplicationController
  def home
    @publication = Publication.new
  end
end
