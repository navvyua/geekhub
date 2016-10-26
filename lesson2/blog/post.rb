class Post
  attr_reader :content, :author, :created_at
  @@posts = []

  def self.show_all
    @@posts.each(&:show)
  end

  def initialize(author:, content:)
    @author = author
    @content = content
    @created_at = Time.now
    @likes = []
    @@posts << self

    puts 'Post created'
  end

  def like(user)
    new_like = Like.new(user: user, post: self)
    @likes << new_like
    user.add_like new_like
  end

  def show_likes
    @likes.each(&:show)
  end

  def show
    puts ''.center(60, '-')
    puts
    puts @content
    puts
    puts "[ Likes #{@likes.size} | Author: #{@author} \
| #{@created_at} ]".center(60)
    show_likes unless @likes.size.zero?
    puts ''.center(60, '-')
  end

  def edit_author!(author)
    last_author = @author
    @author = author
    puts "Author changed from #{last_author} to #{@author}"
  end

  def edit_content!(content = nil)
    return if content.nil? || content.empty?
    @content = content
    puts 'Content changed'
  end

  def delete!
    @@posts.delete(self)
    puts 'Post deleted'
  end

  def to_s
    "#{@author}: #{@content}"
  end
end
