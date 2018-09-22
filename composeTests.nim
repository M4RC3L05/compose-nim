import unittest
import ./compose

suite "Compose Tests":

    setup:
        proc addOne(x: int): int=
            return x + 1

        proc multiplyTwo(x: int): int=
            return x * 2

        proc subtractThree(x: int): int=
            return x - 3

        proc addFour(x: int): int=
            return x + 4

    test "it should compose functions":
        let res = compose[int](
            addOne,
            multiplyTwo,
            subtractThree,
            addFour,
        )(0)

        check(res == 3)
