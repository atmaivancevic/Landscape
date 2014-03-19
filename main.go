package main

import (
        "code.google.com/p/biogo.store/interval"
        "code.google.com/p/biogo.store/interval/landscape"
        "fmt"
        "strconv"
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

	var ivs []iv = []iv{
		{Start: 0, End: 10, UID: 1},
		{Start: 5, End: 8, UID: 2},
		{Start: 6, End: 14, UID: 3},
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
        fmt.Print(strconv.Itoa(r[i].t) + ",")
        for j := 0; j < len(r[i].l); j++ {
        	fmt.Print(" " + strconv.Itoa(r[i].l[j]))
        }
        fmt.Println()
    }
	
}