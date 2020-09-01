type
    BinArray* = ref object of RootObj
        arr: seq[byte]

proc take*(ba: BinArray, s:seq[byte]) =
    ba.arr = s

proc echo*(ba: BinArray) =
    echo ba.arr

proc `[]`*(ba: BinArray, index: int) : byte =
    ba.arr[index]

proc `[]=`*(ba: BinArray, index: int, value: byte) =
    ba.arr[index] = value

proc add*(ba: BinArray, value: byte) =
    ba.arr.add(value)

proc fill*(ba: BinArray, value: byte) =
    for i in 0..<ba.arr.len :
        ba.arr[i] = value

proc fit(bal, bar: var BinArray) =
    if bal.arr.len > bar.arr.len :
        for i in 0..<(bal.arr.len - bar.arr.len) :
            bar.add(0u8)
    else :
        for i in 0..<(bar.arr.len - bal.arr.len) :
            bal.add(0u8)

proc `and`*(bal, bar: BinArray): BinArray =
    var ba1, ba2, result: BinArray
    result = BinArray(arr: @[])
    ba1 =  BinArray(arr: bal.arr)
    ba2 =  BinArray(arr: bar.arr)

    fit ba1, ba2

    for i in 0..<(ba1.arr.len) :
        result.arr.add(ba1.arr[i] and ba2.arr[i])

    result

proc `&`*(bal, bar: BinArray): BinArray =
    bal and bar

proc `or`*(bal, bar: BinArray): BinArray =
    var ba1, ba2, result: BinArray
    result = BinArray(arr: @[])
    ba1 =  BinArray(arr: bal.arr)
    ba2 =  BinArray(arr: bar.arr)

    fit ba1, ba2

    for i in 0..<(ba1.arr.len) :
        result.arr.add(ba1.arr[i] or ba2.arr[i])

    result

proc `|`*(bal, bar: BinArray): BinArray =
    bal or bar

proc `xor`*(bal, bar: BinArray): BinArray =
    var ba1, ba2, result: BinArray
    result = BinArray(arr: @[])
    ba1 =  BinArray(arr: bal.arr)
    ba2 =  BinArray(arr: bar.arr)

    fit ba1, ba2

    for i in 0..<(ba1.arr.len) :
        result.arr.add(ba1.arr[i] xor ba2.arr[i])

    result

proc `^`*(bal, bar: BinArray): BinArray =
    bal xor bar

proc `not`*(ba: BinArray): BinArray =
    var result: BinArray
    result = BinArray(arr: @[])

    for i in 0..<(ba.arr.len) :
        result.arr.add(not ba.arr[i])

    result

proc `~`*(ba: BinArray): BinArray =
    not ba

proc `+`*(bal, bar: BinArray): BinArray =
    var result: BinArray
    result = BinArray(arr: bal.arr & bar.arr)

    result

proc len*(ba: BinArray): int =
    ba.arr.len
