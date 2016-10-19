# Mini game about Nanocat
#
# Author: Eugene Mikhasenko
#
# Features:
#   - You can create your nanocat
#   - You can feed your nanocat
#   - Nanocat can shoots at target
#   - Nanocat can teleports to any location
#   - Nanocat can die of:
#       - overeating
#       - overcharging
#       - starvation
#   - Game will end when nanocat die
class NanoCat
  def initialize(name)
    @name = name
    @energy = 100
    @food = 10
    @created_at = Time.now

    puts "Nanocat #{@name} was created."

    lifecycle
  end

  def shoot(target)
    used_energy = rand(10..30)

    if used_energy > @energy
      puts 'Not enough battery charge for shooting!'
    else
      @energy -= used_energy
      puts "Nanocat #{@name} shoots at #{target}."
    end

    lifecycle
  end

  def rest
    puts "Nanocat #{@name} sleeping, and recovering 50 energy."
    @energy += 50

    die 'overcharging' if @energy > 100
  end

  def teleport(location)
    used_energy = rand(5..20)

    if used_energy > @energy
      puts 'Not enough battery charge for teleport!'
    else
      @energy -= used_energy
      puts "Nanocat #{@name} teleports to #{location}."
    end

    lifecycle
  end

  def feed(eat)
    puts "You feed the nanocat #{@name} #{eat}"
    @food += rand(2..5)

    die 'overeating' if @food > 10
  end

  def help
    puts 'Commands'.center(30, '-')
    puts ' - shoot [target]'
    puts ' - sleep'
    puts ' - teleport [location]'
    puts ' - feed [eat]'
    puts ' - help'
    puts ' - exit'
  end

  private

  def lifecycle
    @energy -= rand(5..10)
    @food -= rand(3)

    check_low_charge
    check_food

    puts "[ Nanocat #{@name}, battery: #{@energy}, food: #{@food} ]"
  end

  def check_low_charge
    return unless @energy < 10
    puts 'Low battary charge! Sleeping mode enabled.'
    rest
  end

  def check_food
    if @food < 1
      die 'starvation'
    elsif @food < 5
      puts "Nanocat #{@name} wants to eat"
    end
  end

  def die(reason)
    puts "Nanocat #{@name} die of #{reason}, he lived for \
      #{Time.now - @created_at} sec."
    exit
  end
end

print 'Enter name for your nanocat: '
cat = NanoCat.new(gets.chomp)
cat.help

command = ''
until command == 'exit'
  case command[0]
  when 'shoot'
    cat.shoot command[1]
  when 'sleep'
    cat.rest
  when 'teleport'
    cat.teleport command[1]
  when 'feed'
    cat.feed command[1]
  when 'help'
    cat.help
  end

  print 'Enter command: '
  command = gets.chomp.split
end
