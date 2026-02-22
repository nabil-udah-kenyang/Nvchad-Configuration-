package main

import "fmt"

func add(a int, b int) int {
	return a + b
}

func main() {
	x := 5
	y := 10

	result := add(x, y)

	fmt.Println(result)
}
