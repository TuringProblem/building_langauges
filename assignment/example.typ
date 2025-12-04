#let question(
  number, 
  prompt, 
  value,
  border-color: rgb("3ded97"),
  value-bg: rgb("#f0f0f0"),
  value-width: 30%
) = {
  box(width: 100%, inset: 8pt, stroke: 1pt + border-color, radius: 5pt)[
    = Question #number:
    #box(width: 100%, inset: 8pt)[
      #align(start)[
        #text(size: 10pt, weight: "bold")[
          #prompt
        ]
      ]
      #align(center)[
        #text(size: 14pt, weight: "bold")[
          #box(width: value-width, inset: 10pt, fill: value-bg, radius: 5pt)[
            #value
          ]
        ]
      ]
    ]
  ]
}

// Use with defaults:
#question(1, "Express in IEEE 754...", [
```bash
  -13.5625 ⇒ (?)
```
])

// Customize colors:
#question(
  2, 
  "What is the binary representation?", 
  [
```bash
    42
```
  ],
  border-color: blue,
  value-bg: rgb("#e0f0ff")
)

#question(
  3, 
  "Solve for x:", 
  [$x^2 + 5x + 6 = 0$],
  border-color: red,
  value-bg: rgb("#ffe0e0"),
  value-width: 50%
)
