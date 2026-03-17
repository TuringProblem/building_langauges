# Language design

## Legend
> - [Type](#type)
> - [Syntax](#syntax)
> - [Semantics](#semantics)

## Type
<sub>[legend](#legend)</sub>

> This language is design to be a simple mathematical language - it is interpreted, and only evaluates mathematical expressions.
***Example***

```bash
1 + 2 #3
((1 + 2) + 6) * 5 #45
8 * 5 / 2 #20
```

## Syntax 
<sub>[legend](#legend)</sub>

The syntax of the language should be described as:
> `<N>` ::= 0 | 1 | ... | 9 
>
> `<OP>` ::= + | - | * | /
>
> `<P>` ::=  ( `<N>` )
>
> ignore whitespace


## Semantics
<sub>[legend](#legend)</sub>

> Division integer will be floored... so 5 / 2 = 2 and we don't care about the .5

-----
idea: 
- Want to potentially create some built-in functions like divides(5, 2) - and returns "5/2" if the number is a fraction. So for example, divides(4, 2) -> 2 and divides(1, 2) -> 1/2 where if you do 1/2 -> 0

