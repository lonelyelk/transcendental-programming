# Lipograms

Lipogram — a composition from which the writer systematically omits a certain letter or certain
letters of the alphabet.

## JSFuck

A well known esoteric language that appeared as a way to bypass suboptimal XSS protection.
The Wikipedia article on [JSFuck][JSFuck] nails it very well.

My version uses `p` from `window.location` protocol «http(s)» in order to use [`unescape`][unescale],
so the example program will only run in a console of a browser.

Given that the method is deprecated, we can probably rewrite it to not depend on the `location`.

To convert any program paste the text of the program in the end of the
[converter](./converters/to_js_f_ck.js) in this line:

```js
console.log(transform(`console.log("hello world!")`))
```

And run.

## Ruby

This is me following the steps of Yusuke Endoh from his talk on «Transcendental Programming in Ruby»
that he gave at «Keep Ruby Weird» conference in 2018.

The way through any constraint to reach full functionality is:

1. Find a way to make numbers
2. Find a way to make letters
3. Find a way to output
4. Find a way to `eval`

### Symbols only

Here is a brief plan on reaching the full functionality without letters:

```ruby
"@@" =~ /$/                                               # 2
"" << 72 << 69 << 76 << 76 << 79                          # "HELLO"
$> << "HELLO"                                             # output
->(&_) { _["", "eval", %q(puts "HELLO")] }[&:"#{"send"}"] # eval
```

To convert any program use the [converter](./converters/to_symbols.rb) as follows:

```shell
echo "puts 'hello world!'" | ruby to_symbols.rb
# or
ruby to_symbols.rb my_prog.rb
```

### Letters only

Here the difficulties are the in the opposite side:

```ruby
eval self # eval
puts self # output

# letters

s = inspect
s.clear
s.concat 72
puts s

#or

class String
  def foo
    clear
    concat 72
  end
end
puts inspect.foo

# or

class String
  def each
    clear
    concat 72
    puts self
  end
end
for x in inspect do end

# numbers

public
def each
  clear
  concat begin
    concat concat concat concat size
    concat concat concat concat hex
    size
  end
  puts self
end

for x in inspect do end

# more

public
def each
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
  puts self
end

for x in inspect do end
```

To convert any program use the [converter](./converters/to_letters.rb) as follows:

```shell
echo "puts 'hello world!'" | ruby to_letters.rb
# or
ruby to_letters.rb my_prog.rb
```

**NOTE: THE CONVERTED PROGRAM IS VERY SLOW, BE EASY ON WHAT YOU WANT IT TO DO**

<!-- links -->

[JSFuck]: https://en.wikipedia.org/wiki/JSFuck
[unescape]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/unescape