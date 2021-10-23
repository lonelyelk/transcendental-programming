require_relative "tools.rb"

eval_block = %q[_="@"=~/$/;__="@@"=~/$/;@_=(""%s);->(&___){___["",""<<(((__+_)*__*__*__+_)*__*__+_)<<((((__+_)*__+_)*__*__+_)*__+_)*__<<((__+_)*__*__*__*__*__+_)<<(((__+_)*__*__+_)*__+_)*__*__,@_]}[&:"#{""<<((((__+_)*__+_)*__*__*__+_)*__+_)<<(((__+_)*__*__*__+_)*__*__+_)<<((((__+_)*__*__+_)*__+_)*__+_)*__<<((__+_)*__*__*__+_)*__*__}"]]
alphabet = eval_block.chars.uniq - %w[% s "]
string_block = input_program.chars.inject("") do |acc, c|
  if alphabet.include?(c)
    acc + %Q(<<"#{c}")
  else
    acc + "<<" + decompose(c.ord).inject("__") do |str, num|
      num == 2 ? "#{str}*__" : "(#{str}+_)"
    end
  end
end

output(format(eval_block, string_block))