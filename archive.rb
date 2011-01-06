require 'fileutils'
move_to_dir = ARGV[0] || Time.now.year.to_s
Dir.foreach(Dir.pwd) do |entry|
  unless [move_to_dir, '.', '..'].include?(entry)
    print "#{entry} (skip/move/trash): "
    case gets.chomp
    when /^m(ove)?$/
      FileUtils.mv entry, move_to_dir
    when /^t(rash)?$/
      FileUtils.mv entry, '.junk'
    end
  end
end
