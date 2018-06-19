require 'rest-client'
require 'json'

class CoordinateInfoController < ApplicationController

    class Coordinate 
        def initialize(longitude_x, latitude_y, key)
            @longitude_x = longitude_x
            @latitude_y  = latitude_y
            @key         = key.to_s 

            puts @longitude_x
            puts @latitude_y
            puts @key
        end

        private def longitude_valid(value)
            (value >= -180 && value <= 180) ? true : false
        end

        private def latitude_valid(value)
            (value >= -90 && value <= 90) ? true : false
        end

        def valid_xy
            ((Float(@longitude_x) rescue false) && (Float(@latitude_y) rescue false)) && 
                (longitude_valid(Float(@longitude_x)) && latitude_valid(Float(@latitude_y))) ? true : false

            #     return true
            # end
            # return false
        end

        def check_key
            # right now we are not checking @key
        end

    end

    def coord_info

        coordinate = Coordinate.new(params[:long_x], params[:lat_y], params[:key])

        if !coordinate.valid_xy
            render json: {error: 1, msg: "invalid long_x and/or lat_y", form: "http://website.com/api/v1?long_x=number&lat_y=number?key=optional" }, status: 400
        end

        # render json: { msg: coordinate.valid_xy.to_s }

    end



end
