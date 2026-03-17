#let notes() = {

}


#let inKeyword = "∈"
#let notInKeyword = "∉"
#let andKeyword = "∧"
#let orKeyword = "∨"
#let impliesKeyword = "⇒"
#let utmLink = "https://www.geeksforgeeks.org/compiler-design/universal-turing-machine/#"

#let makeTextColor(color, text-size: 10pt, content) = {
      text(fill: color, size: text-size, weight: "bold")[
          #content
        ]
}
#let abstract(
  title: none,
  isGrid: false, 
  main-content, 
  secondary-content: none, 
  main-color: rgb("#3ded97"),
  main-box-title: none,
  secondary-box-title: none
  ) = {
  box()[
    == #title 
    #if isGrid {
      grid(
        columns: (1fr, 1fr),  
        gutter: 10pt,         
        [
          #main-box-title
          #box(width: 100%, stroke: 1pt + main-color, fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
            #main-content
          ]
        ],
        
        [
          #secondary-box-title
          #box(width: 100%, stroke: 1pt + main-color, fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
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





= Finite Automata

=== DFA

A very simple (and limited) model of computation. Fixed finite number of states = Fixed amount of memory (non-infinite it's constat)\

A Finite Automaton consists of:\
States (circles) and Transitions (arrows)\
Can execute an automaton on any input w. (No epsilon transitions either, if there is then it's ~(DFA))\

=== NFA

#v(0.5em)

#abstract(title: [Regular Languages], isGrid: true, 
  [
    #text(size: 10pt, weight: "bold")[
      A language L is regular if there exists some finite automaton M that recognizes L.
    ]

    #text(size: 8pt)[
      Regular languages are closed under the union, concatenation, star (also complement and intersection) operations.\

      To prove this we introduced non-determinism (NFA)\

      Showed how to convert any NFA #impliesKeyword DFA\
      ]
  ],
  secondary-content: [
    #text(size: 10pt, weight: "bold")[
       Notation to construct regular lagnagues using regular operations $0 (1 U 0) * 1$
    ]

    #text(size: 8pt)[
      All Regular Languages can be constructed this way (GNFAs)
    ]

    
  ],
  main-color: green,
  main-box-title: [
    Definition: 
  ],
  secondary-box-title: [
    Regular Expressions:
  ]

)

#v(0.5em)

#abstract(title: [Pumping Lemma], isGrid: false, 
  [
    #text(size: 8pt, weight: "bold")[
      $L = {o^n 1^n : n >= 0}$ is not regular
    ]
  ],
  secondary-content: [
    #text(size: 8pt, weight: "bold")[
    ]
  ],
  main-color: yellow,
  main-box-title: [
    Example: 
  ],
  secondary-box-title: [
    Regular Expressions:
  ]

)

#v(0.5em)

#abstract(
  title: [Turing Machines],
  isGrid: false,
  [
    #text(size: 8pt, weight: "bold")[
      A very simple general model of computation, powerful enough to capture all algorithms (DFA you can only read the state, not write while a TM you can read and write and move back and forth)\
    ]

    Configurations: #makeTextColor(black, [`uqv`]) (snapshot of the state of the TM)\

    #align(center)[
    == How to describe a TM?
    ]

    #text(size: 8pt)[
      - State-Diagram\
      - Tape-head level description\
      - Psuedocode (church-turing thesis, you can write an algorithm to describe a Turing Machine) - although the thesis is more with respect to computability, and showing there are different models of computation that represent the same outcome\ 
    ]
    #grid(
        columns: (1fr),  
        gutter: 10pt,         
        [
          #box(width: 100%, stroke: (paint: black, thickness: 1pt, dash: "dashed"), fill: rgb("#f0f0f0"), inset: 10pt, radius: 5pt)[
            #align(center)[
              #text(size: 8pt, fill: black)[

                  A TM M on input w can either #makeTextColor(green, text-size: 8pt, [accept]), #makeTextColor(red, text-size: 8pt, [reject]), #orKeyword #makeTextColor(yellow, text-size: 8pt, [loop])\
                  A TM M decides L if it accepts w $#inKeyword$ L #andKeyword rejects w #notInKeyword L.\
                  A TM M recognizes L If it accepts w #inKeyword L #andKeyword rejects #orKeyword loops on w #notInKeyword L\
              ]
            ]
          ]

           #align(center)[
             #link(utmLink)[*Universal TM:*]    
           ]
           #text(size: 8pt, fill: black)[
            Given #makeTextColor(blue, text-size: 8pt, [`<M>`]), w runs M on w. (Example, operating system is a Universal TM)\
             Useful feature of TMS: Computation is local. Configurations can only change around the tape-head.\
           ]

        ],
      )
  ],
  main-color: black,
  main-box-title: [
  ],
  secondary-box-title: [
    Configurations: 
  ]
)

#v(0.5em)

#abstract(
  title: [Undecidability], 
  isGrid: false,
  [
    #text(size: 8pt, weight: "bold")[
      Undecidable/Unrecognizable languages must exist.\
      - More languages (uncountable) than TMS (countable.)\
    ]

    #align(center)[
      #text(size: 8pt, weight: "bold")[
        $A_(T M)$ = { #makeTextColor(blue, text-size: 6pt, [`<M, w>`]) : $M$ is a $T M$ #andKeyword $M$ accepts w. } is undecidable.\

      ]
    ]

    #text(size: 8pt)[
      Suppose otherwise that there is a Decider D for $A_(T M)$ #impliesKeyword $D_A_(T M)$\ #impliesKeyword #align(center)[$D'(<M>)$ run $D(<M, M>)$ #andKeyword output the #makeTextColor(green, text-size: 8pt, [opposite])].\ #impliesKeyword #align(center)[$D'(<D'>) = $ #makeTextColor(red, text-size: 8pt, [opposite]) of $D'<D'>$] 
    ]
  ],
  main-color: black,
  main-box-title: [
    #text(size: 8pt, weight: "bold")[
      Undecidable/Unrecognizable languages must exist.
    ]
  ],
  secondary-box-title: [
    #text(size: 8pt, weight: "bold")[
      - More languages (uncountable) than TMS (countable.)
    ]
  ]
)

== Undecidability

Undecidable/Unrecognizable languages must exist.\
- More languages (uncountable) than TMS (countable.)\

ATM = { `<M, w>` : M is a TM and M accepts w} is undecidable.\

suppose otherwise that there is a decider D for ATM  \

#impliesKeyword```let D'(`<M>`) "run D(`<M, M>`)``` #andKeyword output the opposite.\

#impliesKeyword ```D'(<D'>) = opposite of D' <D'>```\

Show many other languages are undecidable via reductions.\


== Reductions

Reduce a language A -> B by constructing a decider DA for A using a hypothetical decider DB for B as a "subroutine"\

Mapping reductions: A TM R_A->B that given an input w_A converts it to wB = R_A->B(w_A) so that: w_B in B <==> w_A in A\

By reducing A to B we show:\
If B decidable then A decidable. (Algorithms class)\
If A undecidable then B undeciable. (This class)\

H = {`<M, w>` : M is a TM and M halts on w} H is undecidable:\
Reduce A_TM -> H where A_TM = {`<M, w>` : M is a TM and M accepts w}\

construct decider D_ATM using decider D_H as a subroutine.

```
DATM (<M, w>) {
  DH(<M, W>){
    if rejects, then you know M loops forever on w -> reject
    else run M(w) and output whatever it outputs
  }
}
```

this is a general reduction, but can we build a mapping reduction?\

running m on w has three - accept, reject, and loop forever - halting problem will only show halt= (accept/reject) | (loop) while ATM will show (acc) | (reject/loop)
```
<M, w> -> <M', w'>
R_ATM -> H(<M, w>) = <M', w> where M'(x) = {run M(x) and if it rejects loop}
```


== Undecidability

For any language A: if A is recognizable and A' is regocnizable -> A is decidable.\
'ATM is not recognizable\

Rice's theorem: Given `<M>`, any "non-trivial property" of `L(<M>)` is undeciable.\

Undecidable problems that aren't explicitly about TMs:\
- Post correspondence problem (PCP): arranging dominos\
- Number Theory: statements about natural numbers.\
- Hilbert's 10th problem: Does a polynomial have interger roots?\

Can reduce ATM to these problems. Relies on simplicity of TM configs and computation.


== Comple

TIME(t(n)) : languages that can be decided in O(t(n)) time.\
$P = U_c$ `TIME`($n^c$)

NP\
A poly-time verifier for a language L is a TM V s.t.:\
- w ∈ L =>  #makeTextColor(green, [∃])y V(w, y) #makeTextColor(green, [accepts])\
- w not ∈ L => #makeTextColor(red, [∀])y V(w, y) #makeTextColor(red, [rejects])\
Furthermore, the run-time of V is poly(|w|).\
NP = decidable ∈ poly(n) time on a non-deterministic TM.\

(np complete by reducing from the SAT problem)\ 
EX: SAT, CLIQUE, 3-SAT, SUBSET-SUM, etc.\

know: P subset `NP`  BIG Open Question: Is P = NP?\

== NP-Complete Problems

Definition: A language A is NP-Complete if\
- A in NP\
- Every B in NP is poly-time reducible to A.\

Interpretation: (1) if A in P then P = NP. (2) If P != NP then A ~in P.\
Theorem [Cook-Levin '71]: SAT is NP-Complete.\ (is there a polynomial-time reduction from SAT to CLIQUE??)\

To show a language #makeTextColor(red, [B]) is NP-Complete:\
- Show #makeTextColor(red, [B]) in NP\
- Take any #makeTextColor(blue, [A]) that was previously shown top be NP-Complete and reduce #makeTextColor(blue, [A]) -> #makeTextColor(red, [B])\









