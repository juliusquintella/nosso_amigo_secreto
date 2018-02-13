class PagesController < ApplicationController
  def home
    if user_signed_in?
      @campaigns = current_user.campaigns
    end
  end
end
