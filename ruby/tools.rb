def decompose(num)
  composition = []
  while num > 2
    if num % 2 == 0
      composition.push(2)
      num /= 2
    else
      composition.push(1)
      num -= 1
    end
  end
  composition.reverse
end

def input_program
  input = ""
  if STDIN.tty?
  if (input_file = ARGV.first)
      input = File.read(input_file)
  else
      raise "Expecting file name as the first argument when no input is piped"
  end
  else
  while (line = STDIN.gets)
      input += line
  end
  raise "Expecting non-empty input piped" if input.empty?
  end
  input
end

def output(program)
  output_file = STDIN.tty? ? ARGV[1] : ARGV.first

  if output_file
    File.write(output_file, program)
  else
    print program
  end
end