# s = inspect
# s.clear
# s.concat 72
# puts s

# class String
#   def foo
#     clear
#     concat 72
#   end

#   def each
#     clear
#     concat 72
#     puts self
#   end
# end

public
def each
  clear
  concat begin
    concat concat concat concat size
    concat concat hex
    concat concat hex
    concat concat hex
    concat hex
    size
  ensure
    clear
    concat begin
      concat concat concat concat size
      concat concat hex
      concat concat concat hex
      size
    ensure
      clear
      concat begin
        concat concat concat concat size
        concat concat hex
        concat concat concat hex
        size
      ensure
        clear
        concat begin
          concat concat concat concat concat size
          concat concat concat hex
          concat hex
          size
        ensure
          clear
          concat begin
            concat concat concat concat size
            concat concat concat concat hex
            size
          ensure
            clear
          end
        end
      end
    end
  end
  puts self
end

for x in inspect do end

# inspect.foo

# public begin def each
#   puts "A"
# end rescue puts "B" end
