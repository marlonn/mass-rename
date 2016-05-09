# coding: utf-8
# Changes filename for all files in current directory, or only all JPEGs in
# current directory.
# source: wicked cool ruby scripts(modified for all filetypes instead of just
# .jpg, modified for prefixing the original filename instead of replacing it)

unless ARGV[0]
  puts "\nYou need to specify a filename:  massEdit-allTypes.rb <filename>"
  puts "Optionally, you can rename only .jpgs with the jpg-argument: massEdit-allTypes <filename> jpg\n\n"
  exit
end

name = ARGV[0]
x=0

if ARGV[1] == "jpg"
  #Iterate directory and rename files
  Dir['*.[Jj][Pp]*[Gg]'].each do |pic|
    new_name = "#{name}_#{"%.2d" % x+=1}#{File.extname(pic)}"
    puts "Renaming #{pic} ---> #{new_name}"
    File.rename(pic, new_name)
  end
else
  Dir['*.*'].each do |file|
    new_name = "#{name}_#{File.basename(file)}"
    puts "Renaming #{file} ---> #{new_name}"
    File.rename(file, new_name) unless File.basename(file) == "massEdit-allTypes.rb"
  end
end
