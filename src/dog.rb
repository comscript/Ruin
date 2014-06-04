require "./src/thing"
require "pry"

class Dog < Thing

  is Lizard

  def bark
    puts "woof"
  end

end

class Lizard < Thing

  is :animal
  is :reptile

  def crawl
    puts "crawl!"
  end

end

binding.pry

