# SHA Quine

For those unfamiliar with quines, a question whether a program can output its own SHA sum without
reading any input often seems like a trap. It seems as though a program needs to include its own
checksum in order to output it. In reality though, once you have a string value with the program
code, making any operations with it is trivial.

Here are programs in multiple languages that output its own checksum of the given variety.
All the commands below have to be executed from the [sha](./) folder

```bash
ruby sha.quine.rb
sha1sum sha.quine.rb

# or

ruby sha.quine.rb sha256
sha256sum sha.quine.rb
```

Same works for `js` and `py`. The `terraform` is different as it outputs all of its checksums
as the output.

```bash
terraform plan
sha1sum sha.quine.tf
sha256sum sha.quine.tf
```