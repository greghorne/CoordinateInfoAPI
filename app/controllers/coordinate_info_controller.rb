require 'rest-client'
require 'json'

$db_host = ENV["RAILS_API_HOST"]
$db_name = ENV["RAILS_API_DB"]
$db_port = ENV["RAILS_API_PORT"]
$db_user = ENV["RAILS_API_USER"]
$db_pwd  = ENV["RAILS_API_PWD"]

class CoordinateInfoController < ApplicationController

    # =========================================
    class Coordinate 

        def initialize(longitude_x, latitude_y, key, db)
            @longitude_x = longitude_x
            @latitude_y  = latitude_y
            @key         = key.to_s 

            (db.to_s === "pg" || db.to_s === "mongo") ? @db = db : @db="pg"
        end

        attr_reader :longitude_x, :latitude_y, :key, :db
            
        private def longitude_valid(value)
            (value >= -180 && value <= 180) ? true : false
        end

        private def latitude_valid(value)
            (value >= -90 && value <= 90) ? true : false
        end

        def valid_xy
            ((Float(@longitude_x) rescue false) && (Float(@latitude_y) rescue false)) && 
             (longitude_valid(Float(@longitude_x)) && latitude_valid(Float(@latitude_y))) ? true : false
        end

        def check_key
            # right now we are not checking @key
        end

    end
    # =========================================

    # =========================================
    def get_db_conn(db_type)

        case db_type
            when "pg"
                begin
                    conn = PG::Connection.open(
                        :host     => $db_host,
                        :port     => $db_port,
                        :dbname   => $db_name,
                        :user     => $db_user,
                        :password => $db_pwd
                    )

                    return conn
                rescue PG::Error => e
                    false
                end

            when "mongo"
                begin
                end

        end
    end
    # =========================================

    # =========================================
    def extract_response(result)

        # return_hash = {
        #     :id => result[0]['objectid'],
        #     :name0 => result[0]['name_0'],
        #     :name1 => result[0]['world.name_1'],
        #     :nl_name1 => result[0]['world.nl_name_1'],
        #     :type_1 => result[0]['world.type_1'],
        #     :engtype_1 => result[0]['world.engtype_1']
        # }

puts "trace"
        # always seem to have to do weird string manipulation
        arr_split = result[0]["world_xy_intersect_no_geom"].gsub(/[)(]/, '').split(',')
        puts arr_split

        return_hash = {
            :id => arr_split[0],
            :name0 => arr_split[1],
            :name1 => arr_split[2],
            :nl_name1 => arr_split[3],
            :type_1 => arr_split[4],
            :engtype_1 => arr_split[5]
        }
        puts return_hash
        return return_hash

        
            # world.name_2,
            # world.nl_name_2,
            # world.type_2,
            # world.engtype_2,
            # world.name_3,
            # world.nl_name_3,
            # world.type_3,
            # world.engtype_3,
            # world.name_4,
            # world.type_4,
            # world.engtype_4,
            # world.shape_leng,
            # world.shape_area
        

    end
    # =========================================

    # =========================================
    def coord_info

        # pass request params and create coordinate object
        coordinate = Coordinate.new(params[:long_x], params[:lat_y], params[:key], params[:db])

        # check validity of x,y coordinates
        if !coordinate.valid_xy
            render json: {error: 1, msg: "invalid long_x and/or lat_y", form: "http://website.com/api/v1?long_x=number&lat_y=number?db=pg(or mongo)?key=optional" }, status: 400
        end
       
        # get db connection
        conn = get_db_conn(coordinate.db)
        response_query = conn.query("select world_xy_intersect_no_geom($1, $2)",[coordinate.longitude_x.to_f, coordinate.latitude_y.to_f])
        conn.close

        render json: extract_response(response_query)

        # render json: { municipal_data: response_query[0].to_s }
        

        # render json: {msg: "db connected"}


    end
    # =========================================


end
