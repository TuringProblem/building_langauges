#set page(margin: 1in)
#set text(size: 11pt)

#let customGreen = rgb("#3ded97")
#let customBlue = rgb("#82eefd")

#align(center)[#text(size: 20pt, weight: "bold")[Homework 11]]
#let question(number, prompt, main-question, border-color: rgb("#3ded97"), main-question-bg: rgb("#f0f0f0"), main-question-width: 30%) = {
  box(width: 100%, inset: 8pt, stroke: 1pt + border-color, radius: 5pt)[
  = Question #number:

    #box(width: 100%, inset: 8pt)[
      #align(start)[
        #text(size: 10pt, weight: "bold")[
          #prompt
        ]
      ]
      #align(center)[
        #text(size: 8pt, weight: "bold")[
          #box(width: main-question-width, inset: 10pt, fill: main-question-bg, radius: 5pt)[
            #main-question
          ]
        ]
      ]
    ]
  ]
}



#let solution(isGrid: false, main-content, secondary-content: none, main-color: rgb("#3ded97")) = {
  box()[
    == solution
    #if isGrid {
      grid(
        columns: (1fr, 1fr),  
        gutter: 10pt,         
        [
          Integer conversion:
          #box(width: 100%, stroke: 1pt + main-color, fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
            #main-content
          ]
        ],
        
        [
          Decimal conversion:
          #box(width: 100%, stroke: 1pt + rgb("#3ded97"), fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
            #secondary-content
          ]
        ]
      )
    } else {
      box(width: 100%, stroke: 1pt + main-color, fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
        #main-content
      ]
      if secondary-content != none [
        #secondary-content
      ]
    }
  ]
}


#let generalResponse(main-content, main-color: rgb("#3ded97"), fill-color: rgb("#f0f0f0")) = {
  box(width: 100%, stroke:  (paint: main-color, thickness: 1pt, dash: "dashed"), fill: fill-color, inset: 10pt, radius: 5pt)[
          #main-content
  ]
}



#question(1, "Express the following base 10 number in IEEE 754 single-precision floating-point format. Express your answer in Hexidecimal.",
 [
```bash
-13.5625 ⇒ (?)
```
])


#solution(isGrid: true, 
  [
    ```bash
          ⇒ (13)/2 ⇒ 6 r 1
          ⇒ (6)/2 ⇒ 3 r 0
          ⇒ (3)/2 ⇒ 1 r 1
          ⇒ (1)/2 ⇒ 0 r 1
          
          Result: 1101
    ```
  ], 
  secondary-content: [
    ```bash
        ⇒ (.5625) × 2 = 1.125
        ⇒ (.125) × 2 = 0.25
        ⇒ (.25) × 2 = 0.5
        ⇒ (.5) × 2 = 1.0

        Result: .1001 
    ```

  ]
)

#align(center)[Combining]

#align(center)[
  #box(width: 75%, stroke: 1pt + rgb("#3ded97"), inset: 10pt, radius: 5pt)[
    #align(center)[
      #text(size: 10pt, weight: "bold")[
        ⇒ 1101.1001

        $⇒ 1101.1001 = 1.1011001 × 2^3$
        

        We can create a Generalized Program: 
      ]
      #generalResponse([

        ```ocaml
          (*if sign was not 1 | !(1) = 0.1011001*)
          let Sign = 1;
          let Bias = 127;
          let Exponent = 3;
          (*total = 130 = 10000010*)
          let Total = Bias + Exponent;  
          (*Normalized = above 1.1011001 - sign = 1011001*)
          let Normalized = 1011001;
          let zeroPadding = 0000000000000000;
          (*
            Mantissa consist of the combined binary 
            normalization & the trailing 16 bits (zeroPadding)  
          *)
          let Mantissa = Normalized + zeroPadding; 

          (*
          now combine: {Sign & Total & Mantissa} 
           ⇒ 1 10000010 10110010000000000000000
          *)

          let Result = Sign + Total + Mantissa;

        ```
      ])
        $Q.E.D.$
    ]
  ]
]
#align(center)[
⇒ we can convert the `Mantissa` ⇒ `Hexidecimal` 


]
⇒ 

#align(center)[
  #table(
    columns: 2,
    stroke: 1pt + black,
    inset: 10pt,  // Padding in cells
    
    table.header(
      [*Result*], [*Hexidecimal*],
    ),
    
    [1100], [C],
    [0001], [1],
    [0101], [5],
    [1001], [9],
    [```ocaml
    ZeroPadding```], [0x16 = 000...],
  )
]

#align(center)[
#sym.therefore -13.5625 ⇒ `0xC1590000`
]



#question(
  2, 
  "Convert the following IEEE 754 single-precision floating-point number to decimal format.", 
  [0x40980000], 
  border-color: customBlue,
  main-question-bg: rgb("#e0f0ff")
)
#solution(isGrid: false, [
Starting with:

`0x40980000` ⇒ `0100 0000 1001 1000 0000 0000 0000 0000`
#align(center)[
  #table(
    columns: 2,
    stroke: 1pt + black,
    inset: 10pt,  // Padding in cells
    
    table.header(
      [*hex*], [*binary*],
    ),
    
    [4], [0100],
    [0], [0000],
    [9], [1001],
    [8], [1000],
    [```ocaml
    ZeroPadding```], [0x16 = 000...],
  )
]

⇒ 
#align(center)[
#generalResponse([

```ocaml 
let Sign = 0; 
let exponent = 10000001; (*129*) 
let Mantissa = 00110000000000000000000;
```

⇒ exponent - 127 = 2;
], main-color: customBlue, fill-color: rgb("#cccccc"))
]
Reconstructing Mantissa:\
a
], secondary-content: none, main-color: customBlue)

#question(
  3,
  "Translate this C++ code into RISC-V assembly language with correct use of Floating-Point instructions where necessary. Submit your code and screenshot of the outputs.", 
  [
  ```cpp

  int main() {
   float value1 = 3.5;
   float result = 0;

   if (value1 < 7)
       result = 7 + value1;
   else
       result = value1 / 7;

   cout << result << endl;
  }
  ```

  ], 
  border-color: black, 
  main-question-bg: rgb("#e0f0ff"),
  main-question-width: 50%
)

#solution(isGrid: false, [something], secondary-content: none, main-color: black)

