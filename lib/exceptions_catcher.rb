class ExceptionsCatcher
  def is_txt_file?(path)
    if path.split(//).last(3).join == 'txt'
      true
    else
      puts 'This is not a text file'
      false
    end
  end

  def right_format?(path)
    firstline = File.readlines(path)[0]
    firstline = firstline.strip.split(', ')
    if firstline.include?('Quantity') && firstline.include?('Product') && firstline.include?('Price')
      true
    else
      puts 'Incorrect file format'
      false
    end
  end
end
