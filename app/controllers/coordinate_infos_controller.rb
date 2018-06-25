require 'rest-client'
require 'json'
require 'CoordinateInfoModuleV1'

$db_host = ENV["RAILS_API_HOST"]
$db_name = ENV["RAILS_API_DB"]
$db_port = ENV["RAILS_API_PORT"]
$db_user = ENV["RAILS_API_USER"]
$db_pwd  = ENV["RAILS_API_PWD"]

class CoordinateInfosController < ApplicationController

    include CoordinateInfoModuleV1
    # =========================================
    def coord_info

        # pass request params and create coordinate object
        coordinate = Coordinate.new(params[:long_x], params[:lat_y], params[:key], params[:db])

        # check validity of x,y coordinates
        if !coordinate.valid_xy
            render json: { success: 0, :response => { msg: "invalid lat_y and/or long_x"} }, status: 400
        else
     
            # get db connection and execute query-function
            conn = get_db_conn(coordinate.db)
            response_query = conn.query("select z_world_xy_intersect($1, $2)",[coordinate.longitude_x.to_f, coordinate.latitude_y.to_f])
            conn.close

            if response_query.num_tuples.to_i === 1
                return_json = adjust_response_data(response_query)
            else
                return_json = {}
            end

            render json: { success: 1, results: return_json }
        end

    end
    # =========================================


end
