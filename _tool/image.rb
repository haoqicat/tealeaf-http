# encoding: utf-8
#
# Download all of pictures to local images directory and change
# the related image positions in every chapter

Dir["*/*"].each do |f|
  s = IO.read(f)
  new = s.gsub(/(\!\[.*?\])\((http:.*?)\)/) do |l|
    a = $1.chomp
    h = $2.chomp
    n = $2.split('/').last

    system("wget #{h}")
    system("mv #{n} ../images")

    "#{a}" + "(../../images/#{n})"
  end

  File.open(f, 'w') do |f|
    f.write(new)
  end
end

