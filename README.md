### CoordinateInfoAPI
Rails --api ==> given an x,y coordinate, return information on the intersecting municipality (worldwide)


Scope:

	-	Write a Rails5 API
	-	Given an x, y coordinate, return municipal information that intersects the coordinates.


Data Source:

	-	Global Administrative Areas - www.gadm.org
	-	GADM database of Global Administrative Area
	-	Download “gadm28.zip” which contains an ESRI format shape (.shp) file.
	-	File version 2.8 (November 2015)
	-	shp2pgsql to convert the .shp file into insert statements for a PostgreSQL/PostGIS DB.


Tech Stack:

	-	Ruby 2.5.1p57 (2018-03-09 revision 63029) [i686-linux]
	-	Rails 5.2.0
	-	Development Machine - Vagrant ubuntu/trusty32 - 3.13.0-110-generic 
	-	Vagrant Box setup script: https://github.com/greghorne/VagrantRailsBox/blob/master/setup.sh
	-	PostgreSQL 9.4 with PostGIS 2.1.4 - Database server resides on a Raspberry Pi 2 Model B

API Usage:

    - http://api.website.com/api/v1?long_x=floatr&lat_y=float?db=db_type?key=optional

        long_x = type: float
        lat_y  = type: float
        db     = type: string ==> pg (default) or mongo (not implemented yet)
        key    = type: string ==> authorization key (not implemented yet)

