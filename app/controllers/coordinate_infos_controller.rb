require 'rest-client'
require 'json'
# require '#{RAILS_ROOT}/lib/CoordinateInfoModuleV1.rb'

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

            return_hash = { :success => 0,
                            :results =>  { :msg => e.to_s}
            }

            render json: return_hash, status: 500

        end

    end

end
