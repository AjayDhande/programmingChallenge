# NOTE
# ruby -v => 2.5.1
# gem install prawn

require "./plugin.rb"

puts "Please enter new alien details:"
puts "Please enter code name:"
codeName = gets.chomp
puts "Please enter blood color:"
bloodColor = gets.chomp
puts "Please enter number of antennas:"
noOfAntennas = gets.chomp
puts "Please enter number of legs:"
noOfLegs = gets.chomp
puts "Please enter name of old home planet:"
homePlanet = gets.chomp
str = "Code Name: #{codeName}\nBlood Color: #{bloodColor}\nNo. Of Antennas: #{noOfAntennas}\nNo. Of Legs: #{noOfLegs}\nHome Planet: #{homePlanet}"
puts "Would you like to export text in available format?"
puts "type 'yes' or 'no'"
type = gets.chomp
plug = Plugin.new

def export_available_format(plug, str)
  puts "Export details as following:"
  plug.plugin_text.each_with_index do |txt, index|
    puts "#{index+1}. #{txt}"
  end
  exportFormat = gets.chomp.to_i

  case exportFormat
  when 1..plug.plugin_methods.count
    plug.method("#{plug.plugin_methods[exportFormat-1]}").call(str)
  else
    puts "You have entered invalid export format."
  end  
end

def new_export_format(plug, str)
  puts "Enter new format?"
  puts "Formats examples: csv, doc, xlxs, xls, docx"
  otherFormat = gets.chomp
  plug.other_format str, otherFormat
end


case type
when 'yes'
  export_available_format(plug, str)
when 'no'
  new_export_format(plug, str)
else
  puts "Invalid Input!!!"
end
