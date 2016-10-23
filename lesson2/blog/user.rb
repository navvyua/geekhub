class User
  attr_reader :first_name, :last_name, :age
  attr_writer :likes
  @@users = []

  def self.show_all
    @@users.each(&:show)
  end

  def initialize(first_name:, last_name:, age:)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @likes = []
    @@users << self

    puts 'User created'
  end

  def add_like(like)
    @likes << like
  end

  def show
    puts "#{@first_name} #{@last_name}, #{@age} years old"
  end

  def show_likes
    puts "#{self} likes #{@likes.size} posts"
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end
