# Quines with Constraints

## Palindrome Quine

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

## Quine with Symbols Only

Using Ruby it is possible to write with all sorts of [constraints](../../constraints/lipograms/).
This quine is written without the converter but uses similar principals:

```shell
ruby symbols_only.rb
```
