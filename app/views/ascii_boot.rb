require 'yaml'
require 'gravatar-ultimate'
require 'dbc-ruby'
require 'asciiart'

token_info = File.read(File.expand_path('key.yaml'))
YAML.load(token_info).each do |k,v|
  ENV[k] = v
end


# model =============================

class Cohort
  attr_reader :roster, :length
  def initialize(array_of_student_objects)
    @roster = []
    array_of_student_objects.each do |student|
    @roster << Student.new(student.name, student.email)
    end
    @length = @roster.length
  end
end


class Student
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end


# view ===============================

class Display
  def self.welcome
    puts "Welcome to BootScoop"
  end

  def self.get_input
    puts "1: Bumblebees"
    puts "2: Mud Turtles"
    puts "3: Great North American Carnivorous Horned Owls"
    puts "4: Ospreys - Phase 0"
    puts "5: 'quit' to exit"
    gets.chomp.to_i
  end

  def self.get_guess
    input = gets.chomp
  end

  def self.correct
    thumbs_up = [
      "http://bit.ly/ZZqpSR",
      "http://bit.ly/1yutjON",
      "http://bit.ly/1phEyAI",
      "http://bit.ly/1mzspv2"
    ]
    thumbs_up.sample
  end

  def self.incorrect
    thumbs_down = [
      "http://bit.ly/1rz4bli",
      "http://bit.ly/1DF9QuQ",
      "http://bit.ly/1kQhxbO",
      "http://bit.ly/1qE5xG7"
    ]

    thumbs_down.sample
  end

  def self.clear_screen!
    print "\e[H"
    print "\e[2J"
  end

  def self.score(score,length)
    puts "You got #{score} out of #{length}"
  end




end



# controller =========================
module Controller
  class << self

    def run!
      @quit = false
      @sleep = 2
      @correct = 0
      Display.welcome
      new_cohort(Display.get_input)
      until @cohort.roster.empty? || @quit
        @current_boot = select_boot
        image_url = get_gravatar(@current_boot.email)
        make_ascii(image_url)
        if evaluate_guess(Display.get_guess)
          @correct += 1
          make_ascii(Display.correct)
          puts ""
          p ("~" * 46) + "CORRECT" + ("~" * 46)
          sleep(@sleep)
          # Display.clear_screen!
        else
          break if @quit == true
          make_ascii(Display.incorrect)
          puts ""
          p ("~" * 43) + "SUCK IT, NERD" + ("~" * 43)
          sleep(@sleep)
          # Display.clear_screen!
        end
      end

      Display.score(@correct,@cohort.length)
    end

    def new_cohort(id)
      cohort_translation = {
        1 => 58,
        2 => 57,
        3 => 56,
        4 => 59
      }
      @cohort = Cohort.new(DBC::Cohort.find(cohort_translation[id]).students)
      sleep(0.5)
      puts "hacking the mainframe..."
      sleep(1.5)
      @cohort.roster.shuffle!
    end

    def select_boot
      @cohort.roster.pop
    end

    def get_gravatar(email) # takes student object's email and returns image-url
      Gravatar.new("#{email}").image_url
    end

    def make_ascii(url)
      if url == "http://www.gravatar.com/avatar/29ccc5b18ceab05f3327065878b547af"
        url = "http://bit.ly/ObP4NB"
      end
      ascii = AsciiArt.new(url)
      puts ascii.to_ascii_art
    end

    def evaluate_guess(guess) # guess is user input coming in as a string
      Display.clear_screen!
      if guess.downcase == "quit"
        @quit = true
        make_ascii("http://bit.ly/1f7eneC")
        sleep(1.5)
      end
      guess.downcase == @current_boot.name.split(" ")[0].downcase
    end
  end
end


Controller.run!

