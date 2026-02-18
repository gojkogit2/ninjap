require "ninjap/version"

# MiniMagick is a lightweight wrapper around the ImageMagick CLI.
# It avoids native compilation (unlike RMagick) and is easier to deploy.
begin
  require "mini_magick"
rescue LoadError
  warn "Missing dependency: please `gem install mini_magick` and ensure ImageMagick is installed."
  raise
end

module Ninjap
  class Error < StandardError; end
  # Your code goes here...

  # Gem root (where bundled assets like ninjap.png / fonts live)
  res_path = File.expand_path("..", __dir__) + "/"

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
    require "shellwords"

    template = File.join(res_path, "ninjap.png")
    font_path = File.join(res_path, "SnellRoundhand.ttc")

    unless File.exist?(template)
      puts "Missing template image: #{template}"
      exit
    end

    if ARGV[1].nil?
      puts "Please put candidate name."
      exit
    end

    ninja = ARGV[1]

    if ARGV[2].nil?
      puts "Please put promoter name."
      exit
    end

    promoter = ARGV[2]
    date_str = Time.now.strftime("%d.%m.%Y")

    out_file = ARGV[3]
    out_file = "ninja_cert_for_#{ninja}.png" if out_file.nil? || out_file.strip.empty?

    # Escape single quotes for ImageMagick draw text
    esc = ->(s) { s.to_s.gsub("'", "\\\\'") }

    img = MiniMagick::Image.open(template)

    # Candidate name (center)
    img.combine_options do |c|
      c.font font_path if File.exist?(font_path)
      c.fill "#9d4c0c"
      c.pointsize "200"
      c.gravity "Center"
      c.draw "text 0,-50 '#{esc.call(ninja)}'"
    end

    # Promoter (bottom-right)
    img.combine_options do |c|
      c.font font_path if File.exist?(font_path)
      c.fill "#9d4c0c"
      c.pointsize "100"
      c.gravity "SouthEast"
      c.draw "text 800,550 '#{esc.call(promoter)}'"
    end

    # Date (bottom-left)
    img.combine_options do |c|
      c.font font_path if File.exist?(font_path)
      c.fill "#9d4c0c"
      c.pointsize "100"
      c.gravity "SouthWest"
      c.draw "text 730,550 '#{esc.call(date_str)}'"
    end

    begin
      img.format "png"
      img.write out_file
    rescue => e
      puts "Can't write file: #{e.class}: #{e.message}"
      exit
    end
  end

end