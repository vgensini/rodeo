#Import neccessary Python libraries (this example uses Python 2.7)
import matplotlib
matplotlib.use('Agg')
import numpy as np
import math, pygrib
import matplotlib.pyplot as plt
#import pandas as pd
import datetime
import os,sys
from dateutil.relativedelta import *
from mpl_toolkits.basemap import Basemap, cm
import Nio
import scipy.ndimage
from matplotlib import cm as cm
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
m = Basemap(llcrnrlon=235,llcrnrlat=25,urcrnrlon=267,urcrnrlat=50,resolution='l',projection='merc')
m.drawstates(linewidth=0.5,color='gray')
m.drawcountries(linewidth=0.5,color='gray')
m.drawcoastlines(linewidth=0.5,color='gray')
'''
for date in dates:
	print date
	count = ((date-begdatef).total_seconds())/3600.
	data_file = '/home/apache/climate/gensini/gold/rodeo/data/precip/'+RunInit[2:]+'00F'+ str(int(count)).zfill(3)+'.cfs1'
	gr = pygrib.open(data_file)
	prec = gr.select(name='Total Precipitation')
	lats,lons = prec[0].latlons()
	test =  prec[0].values
'''

grb = Nio.open_file('/home/apache/climate/gensini/gold/rodeo/data/precip/1704170000F360.cfs1','r',format='grb')
prec = grb.variables['APCP_P8_L1_GLL0_acc6h'][:]
lats = grb.variables['lat_0']#[40:66]
lons = grb.variables['lon_0']#[235:268]
print prec.shape
print lats.shape
print lons.shape
print lats[::-1]
#file1 = '/home/apache/climate/gensini/gold/rodeo/forecasts/apcp_week34_20170418.nc'
#nc = Nio.open_file(file1,'r')
#t = nc.variables["apcp_week34"][:]
#lats = nc.variables["lat"][:]
#lons = nc.variables["lon"][:]
# n = 3.
# pi = np.pi
# sgma = n/(pi*np.sqrt(2.))
# accum = scipy.ndimage.filters.gaussian_filter(prec,sgma,order=0)
x,y = np.meshgrid(lons,lats[::-1])
x,y = m(x,y)
colors = [('white')] + [(cm.jet(i)) for i in xrange(1,256)]
new_map = matplotlib.colors.LinearSegmentedColormap.from_list('new_map', colors, N=256)
cs = m.pcolormesh(x,y,prec[::-1],shading='flat',vmin=0,vmax=12,cmap=new_map)
print np.max(prec)
plt.title('Test')
plt.savefig('test.png')
#nc.close()
