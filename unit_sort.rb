class UnitSort
  attr_reader :results

  def initialize(file_path)
    @results = open_data_file(file_path)
  end

  def open_data_file(file_path)
    open(file_path) { |file| sort_by_unit_letter(sort_by_unit_number(file)) }
  end

  private

  def sort_by_unit_number(file)
    file.readlines.sort_by { |x| x[/\d+/].to_i }
  end


  # this handles situations such as #1A #1B etc.
  def sort_by_unit_letter(results)
    n = results.length
    loop do
      swapped = false
      (n-1).times do |i|
        if results[i][/\d+/] == results[i+1][/\d+/]
          if results[i][/[a-z]/i] > results[i+1][/[a-z]/i]
            results[i], results[i+1] = results[i+1], results[i]
            swapped = true
          end
        end
      end
      break unless swapped
    end
    results
  end

end
