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
            if ((Float(@longitude_x) rescue false) && (Float(@latitude_y) rescue false)) && 
                (longitude_valid(Float(@longitude_x)) && latitude_valid(Float(@latitude_y)))

                return true
            end
            return false
        end

        def check_key
            # right now we are not checking @key
        end

    end

    def coord_info

        coordinate = Coordinate.new(params[:x], params[:y], params[:key])
        render json: { msg: coordinate.valid_xy.to_s }

    end



end
