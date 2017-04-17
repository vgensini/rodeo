#Import neccessary Python libraries (this example uses Python 2.7)
import matplotlib
matplotlib.use('Agg')
import numpy as np
import math, pygrib
import matplotlib.pyplot as plt
import pandas as pd
import datetime
import os,sys
from dateutil.relativedelta import *
from mpl_toolkits.basemap import Basemap, cm
import Nio
RunInit = sys.argv[1]
utc = datetime.datetime.now().strftime('%A  %d  %B  %Y  %H:%M UTC')#UTC Generation Time
#generate list of dates that we'll loop through
dates = []
begdate = datetime.datetime.strptime(RunInit,"%Y%m%d%H")
begdatef = datetime.datetime.strptime(RunInit,"%Y%m%d%H")
per1_start = begdate + relativedelta(hours=+360)
per1_end = begdate + relativedelta(hours=+366)
while per1_start < per1_end:
	dates.append(per1_start)
	per1_start+=relativedelta(hours=+6)

fig=plt.figure()
fig.set_size_inches(10,9.5)
m = Basemap(projection='merc',resolution='l',area_thresh=100000.)
m.drawcoastlines(color='gray',zorder=1)
for date in dates:
	print date
	count = ((date-begdatef).total_seconds())/3600.
	data_file = '/home/apache/climate/gensini/gold/rodeo/data/precip/'+RunInit[2:]+'00F'+ str(int(count)).zfill(3)+'.cfs1'
	gr = pygrib.open(data_file)
	prec = gr.select(name='Total Precipitation')
	lats,lons = prec[0].latlons()
	test =  prec[0].values


file1 = '/home/apache/climate/gensini/gold/rodeo/forecasts/apcp_week34_20170418.nc'
nc = Nio.open_file(file1,'r')
t = nc.variables["apcp_week34"][:]
lats = nc.variables["lat"][:]
lons = nc.variables["lon"][:]
print t.shape
nc.close()