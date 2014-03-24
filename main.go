package main

import (
	"bufio"
	"code.google.com/p/biogo.store/interval"
	"code.google.com/p/biogo.store/interval/landscape"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type iv struct {
	Start, End int
	UID        uintptr
}

func (i iv) Overlap(b interval.IntRange) bool { return i.End > b.Start && i.Start < b.End }
func (i iv) ID() uintptr                      { return i.UID }
func (i iv) Range() interval.IntRange         { return interval.IntRange{i.Start, i.End} }

type lr struct {
	t int
	l []int
}

func main() {

	inputFileName := os.Args[1]
	outputFileName := os.Args[2]

	// open inputFile in read-only mode
	inputFile, inputError := os.Open(inputFileName)
	if inputError != nil {
		fmt.Println("An error occurred opening the input file.")
		return
	}
	defer inputFile.Close()

	// open outputFile in write-only mode
	outputFile, outputError := os.Create(outputFileName)
	if outputError != nil {
		fmt.Println("An error occurred with file creation.")
		return
	}
	defer outputFile.Close()

	inputScanner := bufio.NewScanner(inputFile)

	outputWriter := bufio.NewWriter(outputFile)

	// var ivs []iv = []iv{
	// 	{Start: 0, End: 10, UID: 1},
	// 	{Start: 5, End: 8, UID: 2},
	// 	{Start: 6, End: 14, UID: 3},
	// }

	var ivs []iv

	var s []string
	var start, end int64
	uid := 0

	inputScanner.Scan()
	for inputScanner.Scan() {
		s = strings.Split(inputScanner.Text(), "\t")
		start, _ = strconv.ParseInt(s[2], 0, 0)
		end, _ = strconv.ParseInt(s[3], 0, 0)
		ivs = append(ivs, iv{int(start), int(end), uintptr(uid)})
		uid++
	}
	if err := inputScanner.Err(); err != nil {
		fmt.Println("An error occurred while reading the file.")
		return
	}

	var it interval.IntTree
	var r []lr

	for i := 0; i < len(ivs); i++ {
		it.Insert(ivs[i], false)
	}

	landscape.Describe(&it, func(pos int, l []int) {
		if len(l) > 0 {
			r = append(r, lr{pos, append([]int(nil), l...)})
		}
	})

	for i := 0; i < len(r); i++ {
		outputWriter.WriteString(strconv.Itoa(r[i].t))
		for j := 0; j < len(ivs); j++ {
			if j < len(r[i].l) {
				outputWriter.WriteString(" " + strconv.Itoa(r[i].l[j]))
			} else {
				outputWriter.WriteString(" " + "0")
			}
		}
		outputWriter.WriteString("\n")
	}

	// write the buffer completely to the file
	outputWriter.Flush()
}
