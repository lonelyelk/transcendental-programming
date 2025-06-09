# Palindrome Quine

With ruby it is sufficient to write just one half and it will work like a generator. Running:

```shell
ruby palindrome_generator.rb
```

You can see that the actual program is only half, but it outputs the palindrome.

```shell
ruby palindrome.rb | ruby | ruby
```

To verify:

```ruby
code = File.read('palindrome.rb')
puts(code == code.chars.reverse.join)
```
