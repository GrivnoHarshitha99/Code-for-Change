package main

import "fmt"

func main() {
	// This is a comment to show an example of a code line in Go

	// Loop to list numbers from 0 to 2000
	for i := 0; i <= 2000; i++ {
		fmt.Printf("Number %d\n", i)
	}

	//Create a slice with 2001 values
	mySlice := make([]int, 2001)

	//Loop to iterate over the slice and fill it with values
	for i := 0; i < len(mySlice); i++ {
		mySlice[i] = i
	}

	//Loop to iterate over the slice and print the values
	for _, val := range mySlice {
		fmt.Println(val)
	}

	//Create a map containing names and ages
	ages := map[string]int{
		"John":  12,
		"Alice": 20,
		"Bob":   25,
	}

	//Loop to iterate over the map and print the keys and values
	for key, val := range ages {
		fmt.Printf("Name: %s Age: %d\n", key, val)
	}

	//Create a struct
	type person struct {
		name string
		age  int
	}

	//Create an array of 3 person structs
	people := [3]person{
		{
			name: "John",
			age:  12,
		},
		{
			name: "Alice",
			age:  20,
		},
		{
			name: "Bob",
			age:  25,
		},
	}

	//Loop to iterate over the array and print the values in the struct
	for _, p := range people {
		fmt.Printf("Name: %s Age: %d\n", p.name, p.age)
	}

	//Create a function to sum two numbers
	sum := func(a, b int) int {
		return a + b
	}

	//Call the function
	fmt.Println(sum(3, 7)) // Output: 10

	// Create a goroutine
	go func() {
		fmt.Println("Hello from a goroutine")
	}()

	//Create a channel
	myChannel := make(chan string)

	//Create a goroutine
	go func() {
		myChannel <- "Hello from the channel!"
	}()

	//Read from the channel
	fmt.Println(<-myChannel) //Output: "Hello from the channel!"

	//Create a pointer
	a := 5
	b := &a

	//Use the pointer
	*b++
	fmt.Println(a) // Output: 6

	//Define an interface
	type myInterface interface {
		myFunc()
	}

	//Create a struct that implements the interface
	type myStruct struct {
		val int
	}

	//Implement myFunc() in myStruct
	func (m myStruct) myFunc() {
		fmt.Println(m.val)
	}

	//Create an instance of myStruct
	s := myStruct{10}

	//Call myFunc()
	s.myFunc() //Output: 10

	//Create an array of integers
	arr := [5]int{1, 2, 3, 4, 5}

	//Loop to iterate over the array and print the values
	for _, val := range arr {
		fmt.Println(val)
	}

	//Create a slice
	mySlice2 := make([]int, 10)

	//Loop to fill the slice with values
	for i := 0; i < len(mySlice2); i++ {
		mySlice2[i] = i * 2
	}

	//Loop to iterate over the slice and print the values
	for _, val := range mySlice2 {
		fmt.Println(val)
	}

	//Create a map
	myMap := make(map[string]int)

	//Loop to add key value pairs to the map
	for i := 0; i < 5; i++ {
		myMap[fmt.Sprintf("key_%d", i)] = i
	}

	//Loop to iterate over the map and print the keys and values
	for key, val := range myMap {
		fmt.Printf("Key: %s Value: %d\n", key, val)
	}

	//Create a channel of strings
	stringChannel := make(chan string)

	//Create a goroutine to send a message to the channel
	go func() {
		stringChannel <- "Hello from the channel!"
	}()

	//Read the message from the channel
	fmt.Println(<-stringChannel) // Output: Hello from the channel!

	//Use a switch statement
	switch {
	case 1 > 0:
		fmt.Println("1 is greater than 0")
	case 1 == 0:
		fmt.Println("1 is equal to 0")
	default:
		fmt.Println("1 is not greater than or equal to 0")
	}

	//Create a defer statement
	defer fmt.Println("Goodbye!")

	//Print a message
	fmt.Println("Hello!") // Output: Hello! Goodbye!
}