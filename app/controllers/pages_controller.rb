class PagesController < ApplicationController
  def home
    authorize :page
  end

  def visiting
    authorize :page
  end

  def about
    authorize :page
  end
end
