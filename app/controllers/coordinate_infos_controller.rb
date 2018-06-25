require 'rest-client'
require 'json'
require 'CoordinateInfoModuleV1'

class CoordinateInfosController < ApplicationController

    include CoordinateInfoModuleV1

    # =========================================
    def coord_info_v1

        begin
        
            key = params[:key]
            db  = params[:db]

            response = coord_info_do(params[:long_x], params[:lat_y], key, db)

            if JSON.parse(response)["success"] === 1
                render json: response, status: 200
            else
                render json: response, status: 400
            end
       
        rescue Exception => e 
            return "unknown error: " + e.to_s

        end

    end

end
