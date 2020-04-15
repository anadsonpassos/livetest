Dado(/^que eu esteja na home do site$/) do
    # se ENV['env'] for igual a nulo, então @profile_loja = 'DEV', senão @profile_loja = ENV['env']
    ENV['env'] == nil ? @profile_loja = 'HOM' : @profile_loja = ENV['env']
   
    puts " >> RUN PROFILE: " + @profile_loja
   
    case @profile_loja  
      when "CI"  
        visit ENVIRONMENT['HOME']['CI']['url'].gsub('{store_id}',@store_id.downcase)
      when "HOM"
        visit ENVIRONMENT['HOME']['HOM']['url'].gsub('{store_id}',@store_id.downcase)
      when "DEV"
        visit ENVIRONMENT['HOME']['DEV']['url'].gsub('{store_id}',@store_id.downcase)
      when "PRD"
        visit ENVIRONMENT['HOME']['PRD']['url'].gsub('{store_id}',@store_id.downcase)
    end
    @app.busca.button_boas_vindas.visible?.should be true
    @app.busca.button_boas_vindas.click
    #Valida se esta na página correta
    if !(@app.home.has_image_logo?) #  Validar se não tem o logotipo da loja na home page
    end
end
  
  Então(/^produto deve ser apresentado no carrinho$/) do
    # se ENV['env'] for igual a nulo, então @profile_loja = 'DEV', senão @profile_loja = ENV['env']
    ENV['env'] == nil ? @profile_loja = 'HOM' : @profile_loja = ENV['env']
  
    case @profile_loja  
      when "CI"
        visit ENVIRONMENT['CART']['CI']['url'].gsub('{store_id}',@store_id.downcase)
      when "HOM"
        visit ENVIRONMENT['CART']['HOM']['url'].gsub('{store_id}',@store_id.downcase)
      when "DEV"
        visit ENVIRONMENT['CART']['DEV']['url'].gsub('{store_id}',@store_id.downcase)
      when "PRD"
        visit ENVIRONMENT['CART']['PRD']['url'].gsub('{store_id}',@store_id.downcase)
    end
    # Valida se esta na página correta
    page.has_css?('#cart-title') # Valida se a tela contém o texto MINHA SACOLA
    page.has_css?('#product-name200') # Valida se existe produto
    page.has_css?('div.cart-template.full-cart.span12.active > div.summary-template-holder') # Valida resumo da compra
  end
  
#   Quando("eu acessar o carrinho com {string}") do |produto|
#     case produto
#     when "1_carrinho_1_produtos"
   
#     when "2_carrinho_2_produtos"
      
#   end
  
#     @carrinho_model.set_url_add_itens_por_massa(MASS[@store_id]["carrinhos"][massa]["produtos"], url_base)
#     @carrinho_model.frete=(MASS[@store_id]["carrinhos"][massa]["frete"])
#     page.visit(@carrinho_model.url)
#     if @app.carrinho.header.image_easy_checkout_logo.nil? || @app.carrinho.header.link_breadcrumb_carrinho.nil?
#       fail('Página do carrinho não acessada!')
#     end
#   end
   
  Então("eu visualizarei a mensagem de {string} no cenário de {string}") do |mensagem, cenario|
    @app.comum.valida_mensagem(mensagem, cenario)
  end
  
  Dado('debug') do
    binding.pry  ## NÃO REMOVER ESTE bindin.pry
  end
  
  
  