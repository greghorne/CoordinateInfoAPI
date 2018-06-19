class Rack::Attack
    # Exponential backoff for all requests to "/" path
    #
    # Allows 240 requests/IP in ~8 minutes
    #        480 requests/IP in ~1 hour
    #        960 requests/IP in ~8 hours (~2,880 requests/day)
    (3..5).each do |level|
      throttle("req/ip/#{level}",
                 :limit => (30 * (2 ** level)),
                 :period => (0.9 * (8 ** level)).to_i.seconds) do |req|
        req.remote_ip if req.path == "/"
      end
    end
  end