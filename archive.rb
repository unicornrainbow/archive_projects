require 'fileutils'
move_to_dir = ARGV[0] || Time.now.year.to_s

puts <<usage

Project Archiver
======================================================================

Tell me what to do with each entry. Enter nothing to skip.
  - Entries which you move will go to #{move_to_dir}.
  - Entries which you junk will for to .junk.

ctrl-c to exit at any time.

usage

Dir.foreach(Dir.pwd) do |entry|
  unless entry =~ /^\.|^[\d]{4}|#{move_to_dir}/
    print "#{entry} (move/junk) or skip: "
    case gets.chomp
    when /^m(ove)?$/
      FileUtils.mkdir move_to_dir unless File.exists? move_to_dir
      FileUtils.mv entry, move_to_dir
    when /^j(unk)?$/
      FileUtils.mkdir '.junk' unless File.exists? '.junk'
      FileUtils.mv entry, '.junk'
    end
  end
end
