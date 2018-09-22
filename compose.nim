proc compose*[T](fns: openArray[proc (x: T): T{.nimcall.}]): proc(arg: T): T =
    proc inner(fnsSeq: seq[proc (x: T): T{.nimcall.}]): proc(arg: T): T =
        return proc(arg: T): T =
            proc rec(curr: T, arr: openArray[proc (x: T): T{.nimcall.}], i: int): T =
                return if i == arr.len():  curr else: rec(arr[i](curr), arr, i + 1)

            return rec(arg, fnsSeq, 0)

    return inner(@fns)
