```python



def add(a: int) -> int:
    def inner_add(b: int) -> int:

        return a + b
    return inner_add


print(add(1)(2))

addFive = add(5)

print(addFive(5))


def test(test: bool, ) 




```

const add = a => b => a + b

add(1)(5)




const addFive = add(5)

addFive(5) = 10

