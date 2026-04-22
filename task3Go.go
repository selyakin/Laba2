package main

import (
	"fmt"
	"math"
)

func primeNumbers(N int, numbers []int) string {
	if N <= 0 {
		return "Error: некорректный N"
	}
	
	for _, el := range numbers {
		if el <= 0 {
			return "Error: некорректное число (только натуральные числа)"
		}
	}
	
	result := ""
	
	for _, el := range numbers {
		if result != "" {
			result += " "
		}
		
		isPrime := true
		
		if el == 1 {
			isPrime = false
		} else {
			f := int(math.Sqrt(float64(el)))
			for x := 2; x <= f && isPrime; x++ {
				if el%x == 0 {
					isPrime = false
				}
			}
		}
		
		if isPrime {
			result += "Yes"
		} else {
			result += "No"
		}
	}
	
	return result
}

func main() {
	var N int
	
	fmt.Print("Введите количество чисел N: ")
	fmt.Scan(&N)
	
	numbers := make([]int, N)
	
	fmt.Printf("Введите %d чисел: ", N)
	for i := 0; i < N; i++ {
		fmt.Scan(&numbers[i])
	}
	
	fmt.Println(primeNumbers(N, numbers))
}
