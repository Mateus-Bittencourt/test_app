describe 'HTTParty' do
  it 'content-type' do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/50')
      .to_return(status: 200, body: '', headers: { 'content-type': 'application/json; charset=utf-8' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/50')
    content_type = response.headers['content-type']
    puts content_type
    expect(content_type).to match(%r{application/json})
  end
end
