# Transcendental Programming

> Enjoy Programming regardless of practicality.
> Forget usefulness, secular benefits, the weary world and just do programming.
> Abuse a useful programming language to write a completely useless program.

*Yusuke Endoh*

This repository explores the boundaries of self-referential code, constraint-based programming, and
the mathematical beauty hidden within computational systems. Inspired by ruby core developer
Yusuke Endoh's concept of «transcendental programming». These projects demonstrate how code can
transcend its apparent limitations through self-reference and meta-programming techniques.

## What is Transcendental Programming?

A number of inspirational references are gathered in the [presentation slides](./transcendental-programming.pdf)
from a talk on this topic I did for my colleagues.

## Sections

### [Quines](./quines/)

Self-reproducing programs that output their own source code. From basic implementations to animated
palindromic variants and cryptographic self-checksumming programs. It really clicked for me after
I read the [mathematical proof][quine-article] that in any Turing-complete programming language it
is possible to write a quine.

Includes [visual quines](./quines/visual/) that create visual output, from ASCII art to animated
displays.

I also tried out Lean to write the proof down — see [proof](./proof/)

### [Constraints](./constraints/)

Programming under artificial limitations, including [lipograms](./constraints/lipograms/)
(only letters/only symbols), size optimization, and [golf](./constraints/golf/) - the art of extreme
brevity solving problems with minimal characters while exploring the boundaries of syntax and
language features.

### [Other](./other/)

Assortment of other problems that don't have a category so far. Maybe because for now there is only
one.

## Theory and Context


This work draws inspiration from:

- The Oulipo literary movement's constrained writing
- Mathematical concepts of fixed points and self-reference
- Yusuke Endoh's transcendental programming philosophy

## Other Inspirational Resources

- [Transcendental Ruby Imbroglio Contest for rubyKaigi][tric] — participated in 2022 and got
  a judge award from Matz for the most [Reactive and Diffusive][rd]
- [The International Obfuscated C Code Contest][ioccc]


## Philosophy

One of the Oulipo writers described the movement as:

> rats who construct the labyrinth from which they plan to escape

I like the idea of coding for the sake of coding. Trying to bend interpreters and compilers to their
limits. Solving problems based on my interest in them regardless of the practical implications.

<!-- links -->

[quine-article]: http://www.madore.org/~david/computers/quine.html
[tric]: https://github.com/tric
[rd]: https://github.com/tric/trick2022/tree/master/07-lonelyelk
[ioccc]: https://www.ioccc.org/