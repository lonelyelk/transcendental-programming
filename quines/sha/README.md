# Self-Checksumming Programs

For those unfamiliar with quines, the idea of a program outputting its own SHA checksum without
reading external input often seems paradoxical. How can a program know its own hash without already
containing that hash within itself — creating a circular dependency?

The solution reveals a beautiful property of self-referential code: once a program can generate its
own source as a string, any computation on that source becomes possible. These programs demonstrate
this principle by calculating and outputting their own cryptographic checksums.

Here are implementations across multiple languages that output their own checksum using any SHA
variant:

## Ruby, JavaScript, and Python:

```bash
ruby sha.quine.rb        # defaults to sha1
ruby sha.quine.rb sha256 # or specify the algorithm
sha256sum sha.quine.rb   # verify
```

## Terraform

```bash
terraform plan
sha1sum sha.quine.tf
sha256sum sha.quine.tf
```

Each program embeds its complete source code as data, then applies the requested hash function to
that representation — elegantly sidestepping the apparent impossibility of self-reference.
