require 'httparty'
require 'json'
class Postcodeio


  include HTTParty

  attr_accessor :single_postcode_result, :multiple_postcode_result
  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_result = self.class.get("/postcodes/#{postcode}")
    puts JSON.parse(@single_postcode_result.body)
  end

  def get_multiple_postcodes
    @multiple_postcode_result = self.class.post("/postcodes/", :body => {
"postcodes":["ub54jh", "M320JG", "NE301DP"]
})
    puts JSON.parse(@multiple_postcode_result.body)
  end
end

multiple = Postcodeio.new
multiple.get_multiple_postcodes
