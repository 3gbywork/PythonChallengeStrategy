package main

import(
	"fmt"
	"time"
)

func (c *Challenge) Challenge015() {
	var leapYears []int
	for year := 1016; year <= 1996; year+=20 {
    	// 是闰年并且该年1月1日是星期四
		if isLeapYear(year) {
			date := time.Date(year, time.January, 1, 0, 0, 0, 0, time.UTC)
			if date.Weekday()==4 {
				leapYears=append(leapYears, year)
			}
		}
	}
	fmt.Println(leapYears[len(leapYears)-2])
}

func isLeapYear(year int) bool {
	return year%100==0 && year%400==0 || year%4==0
}