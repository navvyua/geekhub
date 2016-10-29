class HelloController < ApplicationController
  def rails
    @users_count = User.count
  end
end