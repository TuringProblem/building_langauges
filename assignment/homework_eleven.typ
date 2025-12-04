#set page(margin: 1in)
#set text(size: 11pt)
#align(center)[
  *Homework 11* \
]

#let customGreen = rgb("#3ded97")
#let customBlue = rgb("#82eefd")

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
  #box(width: 50%, stroke: 1pt + rgb("#3ded97"), inset: 10pt, radius: 5pt)[
    #align(center)[
      #text(size: 10pt, weight: "bold")[
        ⇒ 1101.1001
      ]
    ]
  ]
]



#question(
  2, 
  "Convert the following IEEE 754 single-precision floating-point number to decimal format.", 
  [0x40980000], 
  border-color: customBlue,
  main-question-bg: rgb("#e0f0ff")
)

#solution(isGrid: false, [], secondary-content: none, main-color: customBlue)

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
