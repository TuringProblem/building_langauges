= Introduction

Some simple ideas, and questions that I have about implementation and the language that I'm interested in designing.


= Idea (Come back to this lol)
conditionals as variables... using the keyword `cond` to indicate a conditional type 

```ts



// this is bounding each naming to a reusable condition
cond {xGreaterThanYReturnX | yGreaterThanXReturnY | xAndYAreEqual} = 
  | (x > y) => x  // binds x to this condition - and you can only use x 
  | (x < y) => y 
  | (x == y) => x;



/**
* Potentially better solution for the conditional expression
**/
const values = [1, 2, 3, 4, 5, 6 ,7];

cond {xGreaterThanYReturnX | yGreaterThanXReturnY | xAndYAreEqual} = 
  | (x > y) => x & y;
  | (x < y) => y;
  | (x == y) => x;

// How to use the Condition Expression
xGreaterThanYReturnX(x = 5, y = 20) => {
  .
  <statement>
  .
}; // This will not execute x < y

yGreaterThanXReturnY(x = 5, y = 20) => {
  .
  <statement>
  .
}; // This will not execute x < y


// or if you have an expression already
const comparison x y => x = 10 ^ y = 20;

xGreaterThanYReturnX(comparison) => {
  .
  <statement>
  .
} else { // Will execute else condition in this case, 10 < 20
  .
  <statement>
  .
};


// feeling cool? Let's match these conditions:

const checkTwoNumbers x y = () => {
  match (...) { // (...) means all inputs being passed as arguments.
    | xGreaterThanYReturnX => x + 15; // whatever the value is of x + 15
    | yGreaterThanXReturnY => y + 15; // whatever the value is of y + 15
    | xAndYAreEqual => x + y + 15; // whatever the total value is + 15
  }
}

```
= Potential typing ideas

```ts

const checkTwoNumbers x y = (int, int) => {
  match (...) { // (...) means all inputs being passed as arguments.
    | xGreaterThanYReturnX => x + 15; // whatever the value is of x + 15
    | yGreaterThanXReturnY => y + 15; // whatever the value is of y + 15
    | xAndYAreEqual => x + y + 15; // whatever the total value is + 15
  }
}


// That way in the future if we do parametric polymorphism It might not be messy?

const checkTwoNumbers x y = (N, M) => {
  match (...) { // (...) means all inputs being passed as arguments.
    | xGreaterThanYReturnX => x + 15; // whatever the value is of x + 15
    | yGreaterThanXReturnY => y + 15; // whatever the value is of y + 15
    | xAndYAreEqual => x + y + 15; // whatever the total value is + 15
  }
}
```


=question

#let count = 8
#let nums = range(1, count + 1)

#align(left, table(
  columns: count,
  ..nums.map(n => $F_#n$)
))

#let progress(percent, width: 100%) = {
  box(
    width: width,
    height: 1.2em,
    stroke: 1pt + gray,
    radius: 3pt,
    clip: true,
    place(
      rect(
        width: percent,
        height: 100%,
        fill: gradient.linear(
          black, green 
        )
      )
    )
  )
}
#progress(24%)
#progress(50%)
#progress(75%)
#progress(100%)


#let tree(depth, angle: 30deg) = {
  if depth <= 0 { return }
  
  place(
    line(
      length: 20pt,
      angle: 90deg,
      stroke: 2pt
    )
  )
  // Recursively draw branches
  // (simplified representation)
}



#let todo(..items) = {
  for item in items.pos() [
    #box(
      width: 1em, 
      height: 1em, 
      stroke: 1pt,
      radius: 2pt
    ) #item \
  ]
}

something

#todo(
  "Write code",
  "Test code",
  "Ship code"
)

