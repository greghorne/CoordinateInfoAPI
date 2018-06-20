### CoordinateInfoAPI

Scope:

	-	Write a Rails 5 API
	-	Given an x, y coordinate, return municipality information that intersects the coordinates.


Data Source:

	-	Global Administrative Areas - www.gadm.org
	-	GADM datasetof Global Administrative Area
	-	Downloaded “gadm28.zip” which contains an ESRI format shape (.shp) file.
	-	File version 2.8 (November 2015)
	-	shp2pgsql to convert the .shp file into insert statements for a PostgreSQL/PostGIS DB.


Tech Stack:

	-	Ruby 2.5.1p57 (2018-03-09 revision 63029) [i686-linux]
	-	Rails 5.2.0
	-	Development Machine - Vagrant init ubuntu/trusty32 - (3.13.0-110-generic)
	-	Vagrant Box setup script: https://github.com/greghorne/VagrantRailsBox/blob/master/setup.sh
	-	PostgreSQL 9.4 with PostGIS 2.1.4 - Database server resides on a Raspberry Pi 2 Model B

API Usage:

    - http://api.website.com/api/v1?long_x=floatr&lat_y=float?db=db_type?key=optional

        long_x = type: float (longitude)
        lat_y  = type: float (latitude)
        db     = type: string ==> pg (default) or mongo (not implemented yet)
        key    = type: string ==> authorization key     (not implemented yet)

    - Return value is JSON

        country:              country name in English
        municipality:         municipality name in English
        municipality_nl:      municipality name in native language
        municipality_nl_type: municipality type in native language spelled in English

Examples:

    - example http://api.website.com/api/v1/coord_info?lat_y=15.552727&long_x=48.516388

        returns JSON (intersects location in Yemen): 
        {
            "country": "Yemen",
            "municipality": "Hadramawt",
            "municipaltiy_nl": "حضرموت",
            "municipality_nl_type": "Muhafazah"
        }

    - example http://api.website.com/api/v1/coord_info?lat_y=43.413029&long_x=34.299316

        returns JSON (intersects location in The Black Sea):
        { }

    - example http://api.website.com/api/v1/coord_info?lat_y=23.243660&long_x=88.445670

        returns JSON (intersects location in India)

        {
            "country": "India",
            "municipality": "\"West Bengal\"",
            "municipaltiy_nl": "",
            "municipality_nl_type": "State"
        }

Notes:

    - There are additonal columns to the dataset but I have cut them off at the first four columns.
    - Quoted strings is an inconsistency I have seen in the dataset where most strings are not quoted but there are some that are quoted.  I choose to present the data as is.

    
