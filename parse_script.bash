#!/bin/bash
#DATA taking from NOAA. Data from Jan 2005 and later.
#VARVALUE -- loc_codeYYYYMM

function fetch {
	wget 'http://cdo.ncdc.noaa.gov/qclcd/QCLCD?prior=N&state=IL&VARVALUE=94846'$1'&reqday=E&which=ASCII%20Download%20(Daily%20Summ.)%20(10B)' -O 'data/'$1'.csv'
}

year=2005
month=1
date=200501
while [ $year -le 2015 ]; do
	#echo $year
	while [ $month -le 9 ]; do
		fetch $year'0'$month
		let month=month+1
	done
	while [ $month -le 12 ]; do
		fetch $year$month
		let month=month+1
	done
	let month=01
	
	
	let year=year+1
done

#wget 'http://cdo.ncdc.noaa.gov/qclcd/QCLCD?prior=N&state=IL&VARVALUE=94846201501&reqday=E&which=ASCII%20Download%20(Daily%20Summ.)%20(10B)'
#unzip
#rm all but daily
#repeat
