require "fileutils"

Dir.glob("**/*.mp3").each do |source|
  begin
    renamed = source.gsub(/[^\w|.]/, "_")
    FileUtils.mv source, renamed
  rescue ArgumentError => e
    puts e.message
  end
end

File.open("list.txt", "w") do |file|
  Dir.glob("**/*.mp3").sort!.each do |source|
    file.puts "file '#{source}'"
  end
end
