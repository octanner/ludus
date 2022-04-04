#Graphql API testing
class ToDoAPI
  include ::RSpec::Matchers

  def self.fetch_items
    payload = {
      query:
        <<~GQL
           query {
            fetchItems {
              completed
              createdAt
              id
              note
              priority
              updatedAt
            }
          }
        GQL
    }
    JSON.parse(post(payload).body)
  end

  def self.validate_fetch_items_response(response)
    # choose an assertion/validation method from rspec or capybara to validate that your query
    # response is valid.
  end

  def self.validate_200_response(response)
    # validate graphql returned a 200
  end

  private

  def post(payload)
    url = 'https://setcand-te-ext.alamoapp.octanner.io/graphiql'
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request.body = payload.to_json
    http.request(request)
  end
end
