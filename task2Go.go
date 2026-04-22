package main

import (
	"fmt"
)
func getMessageType(N int, frequencies []int) string {
	if N < 2 {
		return "Неподходящий N"
	}

	for i := 0; i < N; i++ {
		if frequencies[i] <= 0 {
			return "Error: частота должна быть больше нуля"
		}
	}

	increasing := false
	decreasing := false
	vstrechaIsOK := false

	if N > 2 {
		vstrechaIsOK = true
	}

	if frequencies[0] < frequencies[1] {
		increasing = true
	} else if frequencies[0] > frequencies[1] {
		decreasing = true
	}

	for i := 2; i < N; i++ {
		if increasing && (frequencies[i-1] > frequencies[i]) {
			increasing = false
		}
		if decreasing && (frequencies[i-1] < frequencies[i]) {
			decreasing = false
		}
		if frequencies[i-1] == frequencies[i] {
			return "ШУМ"
		}
		if vstrechaIsOK && ((frequencies[i-2] > frequencies[i-1]) == (frequencies[i-1] > frequencies[i])) {
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

func main() {
	var N int

	fmt.Print("Введите кол-во сигналов N: ")
	fmt.Scan(&N)

	frequencies := make([]int, N)

	fmt.Printf("Введите %d частоты: ", N)
	for i := 0; i < N; i++ {
		fmt.Scan(&frequencies[i])
	}

	fmt.Println(getMessageType(N, frequencies))
}
