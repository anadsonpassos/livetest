require 'rest-client'

#Utilizada para requisições do tipo REST (JSON)
class RestService
 
  #url usada para envio de requisições POST e GET
  attr_accessor :url 
  #objeto com a resposta obtida pela requisição, contendo inclusive status, headers, body, etc
  attr_accessor :response 
  #body requisição a ser enviada
  attr_accessor :payload 
  #usuario usado para envio requisição
  attr_accessor :user 
  #senha utilizada para envio requisição
  attr_accessor :password 
  attr_accessor :headers
  #objeto em formato OpenStruct com todas as informações de token
  attr_accessor :token 
  #url usada apenas para obtenção de token de acesso
  attr_accessor :token_url 


  def initialize
    @url = ''
    @user = ''
    @password = ''
    @headers = ''
  end

  # Realiza uma requisição post utilizando os argumentos passados por paramêtro
  # é necessário setar a url, usuário e senha previamente
  # ====== @params
  # * +params+ - Hash com os objetos: :payload e :headers
  # ====== @return
  #  @response = resposta completa requisição
  def customPost(params)
    params[:method] = :post
    client=(params)
    response
    return @response
  end

  # Realiza uma requisição GET que necessita de autorização
  # ====== @return
  #  @response = resposta completa requisição
  def customGet
    @client = RestClient::Resource.new(@url)
    authorization_token
    puts authorization
    @response = @client.get(:Authorization => authorization)
    return @response
  end

  # Realiza uma requisição get simples utilizando apenas a url instância do objeto utilizado
  # ====== @return
  #  @response = resposta completa requisição
  def get
    @response = RestClient.get @url
    return @response
  end

  # Realiza uma requisição post simples utilizando apenas a url instância do objeto utilizado
  # ====== @return
  #  @response = resposta completa requisição
  def post
    @response = RestClient.post @url
    return @response
  end

  # Cria um cliente passando os argumentos do paramêtro
  # ====== @params
  # * +params+ - Hash com os objetos: :method, :payload e :headers
  # ====== @return
  #  @cliente
  private def client=(params)
    @client = RestClient::Request.new({
      method: params[:method],
      url: @url,
      user: @user,
      password: @password,
      payload: params[:payload],
      headers: params[:headers]   #{ :accept => :json, content_type: :json }
    })
    return @client
  end

  # Retorna o cliente
  # ====== @return
  #  @cliente
  def client
    return @client
  end

  # Realiza a execução de um @cliente retornando a sua resposta
  # ====== @return
  #  @response = resposta completa operação
  private def response
    @client.execute do |response, request, result|
      @response = response
      case response.code
        when 400
        	fail("Erro ao executar. Código resposta: " + response.code.to_s + " \nBody: " + response.body)
        	#puts JSON.pretty_generate(JSON.parse(response))
        when 200
        	#SUCESS
        when 204
        	#SUCESS
        else
        	fail "Invalid response #{response.to_s} received."
      end
    end
    return @response
  end

  # Adiciona os parametros passados em Hash na url instância do objeto dessa classe
  # ====== @params
  # * +params+ - Hash contendo o que deverá ser adicionado a url
  # ====== @return
  #  @url = url modificada
  # ====== @examples
  #  #@url = 'http://io.com'
  #  set_url(x => 10, y => 'foo', z => 'bar')        => @url = 'http://io.com?x=10&y=foo&z=bar'
  def set_url(params)
    @url.include('?') ? @url += '&' : @url += '?'
    i = 1
    params.each do |key, value|
      i == 1 ? i += 1 : @url += '&'
      @url += key.to_s + '=' + value.to_s
    end
    return @url
  end

  # Adiciona o access token a @url
  # ====== @params
  # * +url+ - url utilizada para pegar o access token
  # ====== @return
  #  @url = url com access token
  def access_set_token(url)
    set_token(url, @user, @password)
    @url += "?access_set_token" + @token.access_token
    puts @url
    return @url
  end

  # Seta a autorização para realizar uma requisição que necessite chave Authorization
  # ====== @return
  #  @authorization = variável contendo o tipo de autorização com o access token
  def authorization_token
    if (@token == nil)
      set_token(@token_url, @input_user, @input_password)
    end
    @authorization = @token.token_type + " " + @token.access_token
  end

  # Retorna @authorization
  # ====== @return
  #  @authorization
  def authorization
    return @authorization
  end

  # Realiza um set para definir o token
  # ====== @params
  # * +url+ - url utilizada na obtenção do token
  # * +input_user+ - usuário que irá gerar o token
  # * +input_password+ - senha do usuário que irá gerar o token
  # ====== @return
  #  @token
  def set_token(url, user, password)
    @url = url
    @token_url = url
    set_url(username: user, password: password) 
    puts @url
    response = get
    @token = JSON.parse(response, object_class: OpenStruct)
  end

  # Realiza um get para pegar o token
  # ====== @return
  #  @token
  def token
    set_url(username: @user, password: @password) 
    response = get
    @token = JSON.parse(response, object_class: OpenStruct)
    return @token
  end
  
  # Transforma um objeto json em um objeto nativo ruby OpenStruct
  # ====== @params
  # * +json+ - json que deseja transformar
  # ====== @return
  #  Objeto OpenStruct
  def to_openStruct(json)
    return JSON.parse(json, object_class: OpenStruct)
  end
end