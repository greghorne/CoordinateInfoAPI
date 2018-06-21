### CoordinateInfoAPI

Scope:

	-	Create a Rails 5 API
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

    - http://api.website.com/api/v1?long_x=float&lat_y=float&db=db_type&key=optional

        long_x = type: float (longitude)
        lat_y  = type: float (latitude)
        db     = type: string ==> pg (default) or mongo (not implemented yet)
        key    = type: string ==> authorization key     (not implemented yet)

    - Return value is JSON

        country:               country name in English
        municipality1:         municipality name in English
        municipality_nl1:      municipality name in native language
        municipality_nl_type1: municipality type in native language spelled in English
        municipality2:         municipality name in English
        municipality_nl2:      municipality name in native language
        municipality_nl_type2: municipality type in native language spelled in English

Examples:

    - example http://api.website.com/api/v1/coord_info?lat_y=23.243660&long_x=88.445670

        returns JSON (intersects location in India)

        {
            "country": "India",
            "municipality1": "\"West Bengal\"",
            "municipaltiy_nl1": "",
            "municipality_nl_type1": "State",
            "municipality2": "Nadia",
            "municipaltiy_nl2": "",
            "municipality_nl_type2": "District"
        }

        translated as:
            (India, West Bengal State, Nadia District)


    - example http://api.website.com/api/v1/coord_info?lat_y=43.413029&long_x=34.299316

        returns JSON (intersects location in The Black Sea):
        { }


    - example http://api.website.com/api/v1/coord_info?lat_y=15.552727&long_x=48.516388

        returns JSON (intersects location in Yemen): 
        {
            "country": "Yemen",
            "municipality1": "Hadramawt",
            "municipaltiy_nl1": "حضرموت",
            "municipality_nl_type1": "Muhafazah",
            "municipality2": "\"Wadi Al Ayn\"",
            "municipaltiy_nl2": "\"وادي العين وحوره\"",
            "municipality_nl_type2": "Muderiah"
        }

        translated as:
            (Yemen, Hadramawt Muhafazah, Wadi Al Ayn Muderiah) or
            (Yemen, Hadramawt حضرموت, Wadi Al Ayn وادي العين وحوره)


Notes:

    - There are additonal columns in the dataset but I have cut them off at the first two interations of a location.


