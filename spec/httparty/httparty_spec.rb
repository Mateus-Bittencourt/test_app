describe 'HTTParty' do
  # it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', record: :new_episodes } do
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/50')
    #   .to_return(status: 200, body: '', headers: { 'content-type': 'application/json; charset=utf-8' })

    # VCR.use_cassette('jsonplaceholder/posts') do
    #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/50')
    #   content_type = response.headers['content-type']
    #   expect(content_type).to match(%r{application/json})
    # end

    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/52")
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end
end
