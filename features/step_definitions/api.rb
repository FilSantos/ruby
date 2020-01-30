require 'httparty'
require 'json'


Quando("realizar a inclusão de um POST com {string}, {string}, {string}") do |title, body, userId|



    requestBody = JSON[{
        "data": 
          {
          "title": title,
          "body": body,
          "userId": userId
          }
        }]

    $payload = HTTParty.post( "http://jsonplaceholder.typicode.com/posts",
    {   :headers => {"Content-Type" => "application/json"},
        :body    => requestBody
    }
    )

  end
  
  Então("o sistema retorna o código {int}") do |codigo|
    expect($payload.code). to eq(codigo) 
  end
  
  Então("verifico se os dados {string}, {string}, {string} estão corretos") do |title, body, userId|
    expect($payload['data']['userId']). to eq(userId)
    expect($payload['data']['body']). to eq(body)
    expect($payload['data']['title']). to eq(title)
  end
  