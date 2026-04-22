package main

import (
	"fmt"
)

func canCoverge(N int, X int, S string) string {
	if N < 0 {
		return "Error: must N >= 0!"
	}
	if X < 0 {
		return "Error: must X >= 0!"
	}
	if len(S) != N {
		return "Error: S length must be N!"
	}

	towerCoverage := make([]bool, N)

	for i := 0; i < N; i++ {
		if S[i] == '1' {
			left := i - X
			if left < 0 {
				left = 0
			}
			right := i + X
			if right > N-1 {
				right = N - 1
			}
			for j := left; j <= right; j++ {
				towerCoverage[j] = true
			}
		} else if S[i] != '0' {
			return "Error: S must contain only 0 and 1!"
		}
	}

	for i := 0; i < N; i++ {
		if !towerCoverage[i] {
			return "No"
		}
	}

	return "Yes"
}

func main() {
	var N, X int
	var S string

	fmt.Print("Enter N, X and string S: ")
	fmt.Scan(&N, &X, &S)

	fmt.Println(canCoverge(N, X, S))
}
