class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :new ]

  def home
  end

  def score_information
  end
end
