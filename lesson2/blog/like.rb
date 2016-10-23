class Like
  attr_reader :user, :post

  def initialize(user:, post:)
    @user = user
    @post = post
  end

  def show
    puts "[#{@user} likes #{@post}]"
  end
end
