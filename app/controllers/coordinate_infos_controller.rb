require 'rest-client'
require 'json'
require 'CoordinateInfoModuleV1'


# $db_host = ENV["RAILS_API_HOST"]
# $db_name = ENV["RAILS_API_DB"]
# $db_port = ENV["RAILS_API_PORT"]
# $db_user = ENV["RAILS_API_USER"]
# $db_pwd  = ENV["RAILS_API_PWD"]

class CoordinateInfosController < ApplicationController

    include CoordinateInfoModuleV1

    # =========================================
    def coord_info

        begin
        
            key = params[:key]
            db  = params[:db]

            response = coord_info_do(params[:long_x], params[:lat_y], key, db)

            parsed = JSON.parse(response)

            if parsed["success"] 
                render json: response, status: 400
            else
                render json: response, status: 200
            end
       
        rescue Exception => e 
            return "unknown error: " + e.to_s

        end

    end

end
