require "ninjap/version"
require "RMagick"

module Ninjap
  class Error < StandardError; end

  # Your code goes here...
  command = ARGV[0]
  if command != nil
    command = command.downcase
  end

  if (command == nil) || (command == "") || !( (command.eql? "--promote") || (command.eql? "-p") || (command.eql? "--help") || (command.eql? "-h") )
    puts "No command, it can be [--promote] [-p] [--help] [-h]"
    exit
  end

  if (command.eql? "--help") || (command.eql? "-h")
    puts "Commands are:"
    puts "--promote, -p  to start promoting"
    puts "--help -h"
    puts "Usage:"
    puts "ninjap -p \"Great Person\" \"My Name\" output_file"
    puts "If output file is not set, will try to write current directory."
    puts "output file can be \"/tmp/ninja_cert_for_Great_Person.png\""
  end

  if (command.eql? "--promote") || (command.eql? "-p")
    img = Magick::Image.read("ninjap.png")[0]


    if  ARGV[1] == nil
      puts "Please put candidate name."
      exit
    end
    text = Magick::Draw.new
    message = ARGV[1] #"Gojko"
    ninja = message
    img.annotate(text, 0, 0, 0, -50, message) do
      text.gravity = Magick::CenterGravity # Text positioning
      text.pointsize = 200 # Font size
      text.fill = "#9d4c0c" # Font color
      text.font = "SnellRoundhand.ttc" # Font file; needs to be absolute
      img.format = "png"
    end

    if  ARGV[2] == nil
      puts "Please put promoter name."
      exit
    end
    message = ARGV[2]
    img.annotate(text, 0, 0, 800, 550, message) do
      text.gravity = Magick::SouthEastGravity # Text positioning
      text.pointsize = 100 # Font size
      text.fill = "#9d4c0c" # Font color
      text.font = "SnellRoundhand.ttc" # Font file; needs to be absolute
      img.format = "png"
    end

    message = Time.now.strftime("%d.%m.%Y")
    img.annotate(text, 0, 0, 730, 550, message) do
      text.gravity = Magick::SouthWestGravity # Text positioning
      text.pointsize = 100 # Font size
      text.fill = "#9d4c0c" # Font color
      text.font = "SnellRoundhand.ttc" # Font file; needs to be absolute
      img.format = "png"
    end

    out_file = ARGV[3]
    if  out_file == nil
      out_file = "ninja_cert_for_#{ninja}.png"
    end
    begin
      img.write(out_file) # Destination images
    rescue
      puts "Can't write file."
      exit
    end
  end

end