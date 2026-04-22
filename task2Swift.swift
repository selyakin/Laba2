import Foundation

func getMessageType(_ N: Int, _ frequencies: [Int]) -> String {
    if N < 2 {
        return "Неподходящий N"
    }
    
    for i in 0..<N {
        if frequencies[i] <= 0 {
            return "Error: частота должна быть больше нуля"
        }
    }
    
    var increasing = false
    var decreasing = false
    var vstrechaIsOK = false
    
    if N > 2 {
        vstrechaIsOK = true
    }
    
    if frequencies[0] < frequencies[1] {
        increasing = true
    } else if frequencies[0] > frequencies[1] {
        decreasing = true
    }
    
    for i in 2..<N {
        if increasing && frequencies[i-1] > frequencies[i] {
            increasing = false
        }
        if decreasing && frequencies[i-1] < frequencies[i] {
            decreasing = false
        }
        if frequencies[i-1] == frequencies[i] {
            return "ШУМ"
        }
        if vstrechaIsOK && (frequencies[i-2] > frequencies[i-1]) == (frequencies[i-1] > frequencies[i]) {
            vstrechaIsOK = false
        }
    }
    
    if increasing {
        return "АТАКАКА"
    }
    if decreasing {
        return "ОТСТУПЛЕНИЕ"
    }
    if vstrechaIsOK {
        return "ВСТРЕЧА"
    }
    return "ШУМ"
}

print("Введите кол-во сигналов N: ", terminator: "")
let N = Int(readLine() ?? "") ?? 0

print("Введите \(N) частоты: ", terminator: "")
let input = readLine() ?? ""
let frequencies = input.split(separator: " ").compactMap { Int($0) }

// Проверка длины массива
if frequencies.count != N {
    print("Error: введено \(frequencies.count) частот, а ожидалось \(N)")
} else {
    print(getMessageType(N, frequencies))
}
