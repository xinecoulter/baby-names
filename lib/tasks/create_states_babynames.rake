task :create_states_babynames => :environment do

  require 'open-uri'

  state_list = File.new('namesbystate/list.txt', 'r')

  i = 0
  state_list.each do |state_list_line|
    puts "-------Count: " + i.to_s + "----------------------------------------------" + state_list_line.chomp
    state = State.create(state_abbreviation: state_list_line.chomp)

    state_file = File.new('namesbystate/' + state_list_line.chomp + '.TXT', 'r')

    state_file.each do |state_file_line|
      puts state_file_line
      babyname_info_array = state_file_line.split(',')
      puts babyname_info_array
      babyname = Babyname.create(name: babyname_info_array[3], birth_year: babyname_info_array[2].to_i, gender: babyname_info_array[1], frequency: babyname_info_array[4].to_i)
      state.babynames << babyname
    end

    state.save
    state_file.close
    i += 1
  end
  state_list.close

end