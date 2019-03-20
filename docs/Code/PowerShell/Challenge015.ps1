$LeapYears=@()
for ($year = 1016; $year -le 1996; $year+=20) {
    # 是闰年并且该年1月1日是星期四
    if ([datetime]::IsLeapYear($year) -and [datetime]::new($year,1,1).DayOfWeek -eq [System.DayOfWeek]::Thursday) {
        $LeapYears+=$year
    }
}

$LeapYears[-2]