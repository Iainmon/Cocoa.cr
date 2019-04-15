require "colorize"

module Cocoa
  def log(input)
    puts ("[LOG] | #{input}".colorize(:blue))
  end
  def info(input)
    puts ("[INFO] | #{input}".colorize(:cyan))
  end
  def warn(input)
    puts ("[WARN] | #{input}".colorize(:yellow))
  end
  def error(input)
    puts ("[ERROR] | #{input}".colorize(:red))
  end
  module Debug
    def log(input)
      puts ("[LOG] | #{input}".colorize(:blue))
    end
    def info(input)
      puts ("[INFO] | #{input}".colorize(:cyan))
    end
    def warn(input)
      puts ("[WARN] | #{input}".colorize(:yellow))
    end
    def error(input)
      puts ("[ERROR] | #{input}".colorize(:red))
    end
  end
end


