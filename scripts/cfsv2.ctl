dset ^../data/precip/1705150000F%f3.cfs1
index ^../data/precip/1705010000F360.cfs1.idx
undef 9.999E+20
title ../data/precip/1705010000F360.cfs1
* produced by g2ctl v0.1.2
* command line options: ../data/precip/1705010000F360.cfs1
* griddef=1:0:(360 x 181):grid_template=0:winds(N/S): lat-lon grid:(360 x 181) units 1e-06 input WE:NS output WE:SN res 48 lat 90.000000 to -90.000000 by 1.000000 lon 0.000000 to 359.000000 by 1.000000 #points=65160:winds(N/S)
options template
dtype grib2
ydef 181 linear -90.000000 1
xdef 360 linear 0.000000 1.000000
tdef 168 linear 00Z15may2017 6hr
zdef 1 linear 1 1
vars 1
APCPsfc   0,1,0   0,1,8,1 ** surface Total Precipitation [kg/m^2]
ENDVARS
