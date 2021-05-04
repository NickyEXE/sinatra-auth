class BreakingBadAPI

  attr_reader :response

  def initialize
    @response = HTTParty.get("https://breakingbadapi.com/api/characters")
    # uri = URI.parse("https://breakingbadapi.com/api/characters")
    # response = Net::HTTP.get(uri)
    # @response = JSON.parse(response)
  end

end
