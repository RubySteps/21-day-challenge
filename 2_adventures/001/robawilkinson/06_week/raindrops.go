package raindrops

import "fmt"
import "strconv"

const TestVersion = 1

func Convert(input int) string {
	output := ""
	array_of_primes := prime(input)
	var output_array []int
	flatten_array(input, array_of_primes, &output_array)
	fmt.Println(output_array)
	// reverse the array
	for i, j := 0, len(output_array)-1; i < j; i, j = i+1, j-1 {
		output_array[i], output_array[j] = output_array[j], output_array[i]
	}
	// added a test to make sure tht the array of prime factors multiplied equals the input
	test := 1
	for i := 0; i < len(output_array); i++ {
		test *= output_array[i]
		if len(output_array) == 1 && input > output_array[0] {
			test *= output_array[i]
		}
	}
	if test == input {
		fmt.Println("test passed")
	}
	// set bools for whether there is a 3 5 or 7
	var plinged, planged, plonged bool
	for i := 0; i < len(output_array); i++ {
		if output_array[i] == 3 {
			output += "Pling"
			plinged = true
		}
		if output_array[i] == 5 {
			output += "Plang"
			planged = true
		}
		if output_array[i] == 7 {
			output += "Plong"
			plonged = true
		}
	}
	// if none of the bools are true, output equals string of input
	if !plonged && !plinged && !planged {
		output = strconv.Itoa(input)
	}
	return output
}

// takes the input number, an array of primes and a pointer to the output array

func flatten_array(number int, arr []int, output *[]int) {
	// makes a copy of the output pointer to let us use length
	temp := *output
	// breaks when array is empty
	if len(arr) > 0 {
		// if the number is divided evenly by the last element of the array it appends it to the output array
		if number%arr[len(arr)-1] == 0 {
			number = number / arr[len(arr)-1]
			*output = append(temp, arr[len(arr)-1])
		}
		// calss itself recursively with the new shortened array
		arr = arr[0:(len(arr) - 1)]
		flatten_array(number, arr, output)
	}
}

// takes an integer, and returns an array of its prime divisors
func prime(num int) []int {
	s := make([]int, 0)
	for i := 0; i <= num; i++ {
		if len(divisor(i)) == 2 {
			s = append(s, i)
		}
	}
	return s
}

// takes an integer and returns an array of its divisors
func divisor(num int) []int {
	s := make([]int, 0)
	for i := 1; i <= num; i++ {
		if num%i == 0 {
			s = append(s, i)
		}
	}
	return s
}
