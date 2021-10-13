import Foundation

let inputString = "IIWSYAUGCUSSSQI"
let inputArray = Array(inputString)
var arrayOutput = Array<String>()

var countRepeatChar = 0
var currentChar = ""
for index in 0..<inputArray.count {
    arrayOutput.append(String(inputArray[index]))
    
    if index == inputArray.count - 1 {
        arrayOutput.append(String(countRepeatChar + 1))
        break
    } else if inputArray[index] == inputArray[index + 1] {
        countRepeatChar += 1
        currentChar = String(inputArray[index])
        arrayOutput.removeLast()
    } else {
        arrayOutput.append(String(countRepeatChar + 1))
        countRepeatChar = 0
        currentChar = ""
    }
}

print(inputString)
print(arrayOutput.reduce("", { lhs, rhs in
    return lhs + rhs
}))
