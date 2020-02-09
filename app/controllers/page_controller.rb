class PageController < ApplicationController
  def index
    @user_count = User.confirmed.count
  end
end
