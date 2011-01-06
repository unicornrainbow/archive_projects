
class Projects < Thor

  desc 'archive', 'Archive and junk old entres littering your directory.'
  def archive(move_to_dir = Time.now.year.to_s)
    FileUtils.mkdir move_to_dir
    Dir.foreach(Dir.pwd) do |entry|
      unless entry =~ /^\.|^[\d]{4}|#{move_to_dir}/
        case ask "#{entry} (move/junk) or skip: "
        when /^m(ove)?$/
          FileUtils.mkdir move_to_dir
          FileUtils.mv entry, move_to_dir
        when /^j(unk)?$/
          FileUtils.mkdir '.junk'
          FileUtils.mv entry, '.junk'
        end
      end
    end
  end

end
