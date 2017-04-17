#/bin/csh -f
#DESCRIPTION: THIS SCRIPT DOWNLOADS CFS DATA
#from the NCEP NOMADS server	
#LAST EDIT: 02-20-2015  GENSINI									
#LAST EDIT: 02-20-2015 GENSINI
#####################################################
#PASS THE VALID RUN HOUR
set ModRunTime = $1
#DATE VARIABLE formatted YYYYMMDD
if ($ModRunTime == 18) then
	set dtstr = `date -d "-1 day" +%Y%m%d`
	set filstr = `date -d "-1 day" +%y%m%d`
	set InitDate = `date -d "-1 day" +"%b %d %Y"`
else
	set dtstr = `date -u +%Y%m%d`
	set filstr = `date -u +%y%m%d`
	set InitDate = `date +"%b %d %Y"`
endif
set InitDate = `date -d "${InitDate} + ${ModRunTime} hours"`
#set dtstrh = `date -u +%Y%m%d%H`
#STRING VARIABLE FORMATTED YYMMDD
#set filstr = `date -u +%y%m%d`
#MANUAL OVERRIDE OF DATE AND TIME STRING
#set dtstr = "20150219" 
#set filstr = "150219"
#SET WORKING DIRECTORY FOR GFS MODEL DATA
#BEGIN LOOP
foreach FHour (360 366 372 378 384 390 396 402 408 414 420 426 432 438 444 450 456 462 468 474 480 486 492 498 504 510 516 522 528 534 540 546 552 558 564 570 576 582 588 594 600 606 612 618 624 630 636 642 648 654 660 666 672 678 684 690 696 702 708 714 720 726 732 738 744 750 756 762 768 774 780 786 792 798 804 810 816 822 828 834 840 846 852 858 864 870 876 882 888 894 900 906 912 918 924 930 936 942 948 954 960 966 972 978 984 990 996)
	# Full grib file path and name: (Z)
	#set filepathname = ${DIR}/${filstr}${ModRunTime}00F${FHour}.cfs
	#set count = 0
	#set filesize = 0
	set ftime = ( `date -d "${InitDate} +${FHour} hours" +%Y%m%d%H` )
	wget -nv -c "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_pgb.pl?file=pgbf${ftime}.01.${dtstr}${ModRunTime}.grb2&all_lev=on&var_APCP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F${ModRunTime}%2F6hrly_grib_01" -O /home/apache/climate/gensini/gold/rodeo/data/precip/${filstr}${ModRunTime}00F${FHour}.cfs1
	wget -nv -c "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_pgb.pl?file=pgbf${ftime}.02.${dtstr}${ModRunTime}.grb2&all_lev=on&var_APCP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F${ModRunTime}%2F6hrly_grib_02" -O /home/apache/climate/gensini/gold/rodeo/data/precip/${filstr}${ModRunTime}00F${FHour}.cfs2
	wget -nv -c "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_pgb.pl?file=pgbf${ftime}.03.${dtstr}${ModRunTime}.grb2&all_lev=on&var_APCP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F${ModRunTime}%2F6hrly_grib_03" -O /home/apache/climate/gensini/gold/rodeo/data/precip/${filstr}${ModRunTime}00F${FHour}.cfs3
	wget -nv -c "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_pgb.pl?file=pgbf${ftime}.04.${dtstr}${ModRunTime}.grb2&all_lev=on&var_APCP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F${ModRunTime}%2F6hrly_grib_04" -O /home/apache/climate/gensini/gold/rodeo/data/precip/${filstr}${ModRunTime}00F${FHour}.cfs4
	wget -nv -v "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_flx.pl?file=flxf${ftime}.01.${dtstr}${ModRunTime}.grb2&lev_2_m_above_ground=on&var_TMAX=on&var_TMIN=on&var_TMP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F00%2F6hrly_grib_01" -O /home/apache/climate/gensini/gold/rodeo/data/temp/${filstr}${ModRunTime}00F${FHour}.cfs1
	wget -nv -v "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_flx.pl?file=flxf${ftime}.02.${dtstr}${ModRunTime}.grb2&lev_2_m_above_ground=on&var_TMAX=on&var_TMIN=on&var_TMP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F00%2F6hrly_grib_02" -O /home/apache/climate/gensini/gold/rodeo/data/temp/${filstr}${ModRunTime}00F${FHour}.cfs2
	wget -nv -v "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_flx.pl?file=flxf${ftime}.03.${dtstr}${ModRunTime}.grb2&lev_2_m_above_ground=on&var_TMAX=on&var_TMIN=on&var_TMP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F00%2F6hrly_grib_03" -O /home/apache/climate/gensini/gold/rodeo/data/temp/${filstr}${ModRunTime}00F${FHour}.cfs3
	wget -nv -v "http://nomads.ncep.noaa.gov/cgi-bin/filter_cfs_flx.pl?file=flxf${ftime}.04.${dtstr}${ModRunTime}.grb2&lev_2_m_above_ground=on&var_TMAX=on&var_TMIN=on&var_TMP=on&leftlon=0&rightlon=360&toplat=90&bottomlat=-90&dir=%2Fcfs.${dtstr}%2F00%2F6hrly_grib_04" -O /home/apache/climate/gensini/gold/rodeo/data/temp/${filstr}${ModRunTime}00F${FHour}.cfs4

end
