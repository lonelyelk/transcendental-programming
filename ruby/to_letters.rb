require_relative "tools.rb"

eval_block = <<-RUBY
public begin def each
%s
eval self
end end
for x in inspect do end
RUBY
string_block = input_program.chars.inject("clear") do |acc, c|
  letter_block = decompose(c.ord).each_with_object(["concat concat size"]) do |num, lines|
    num == 2 ? lines.last.prepend("concat ") : lines.push("concat hex")
  end
  <<~RUBY
    clear
    concat begin
    #{letter_block.join("\n")}
    size
    ensure
    #{acc}
    end
  RUBY
end

output(format(eval_block, string_block).gsub!(/\n+/, "\n"))
