require "gosu"
require "chipmunk"
require "pry"
require "perlin"


def require_ALL_the_things(path)
  things = Dir[path+"/*"]
  folders = []
  things.each do |thing|
    if File.extname(thing) == ".rb"
      require thing[0..-4] #Slice off the extension before requiring!
    else
      folders << thing
    end
  end
  folders.each {|folder| require_ALL_the_things(folder)}
end

require_ALL_the_things("./src")
