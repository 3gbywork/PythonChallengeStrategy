import calendar

leapYears=[]
for year in range(1016, 1996+1, 20):
    # 是闰年并且该年1月1日是星期四
    if calendar.isleap(year) and calendar.weekday(year,1,1)==3:
        leapYears.append(year)
print(leapYears[-2])