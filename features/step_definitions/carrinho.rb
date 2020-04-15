Quando("adicionar um produto no carrinho") do
  @app.home.image_logo.click
  @app.carrinho.compra_primeiro_produto_disponível
end

# Quando("adicionar dois produto no carrinho") do
#   @app.home.image_logo.click
#   @app.carrinho.adicionar_dois_produto_disponível
# end

# Quando("alterar a quantidade do produto {string} para {int}") do |produto, quantidade|
#   @app.carrinho.alterar_quantidade(produto, quantidade)
#   @quantidade_apos_alterar = quantidade
# end

# Quando("a quantidade do {string} tera sido alterada para o valor {string}") do |produto, quantidade|
#   @quantidade_apos_alterar == quantidade.to_i ? true:fail("false")
#   if @app.carrinho.input_produto2.visible?
#   elsif @app.carrinho.label_valor_primeiro_produto.visible?
#   end
# end

# Então("o valor do produto deve ser {int} vezes o valor unitario do produto {string}") do |quantidade, produto|
#   @app.carrinho.validar_valor(quantidade)
# end

# Quando("alterar para {string} a quantidade do produto {string} em {string} vezes") do |operador, produto, quantidade|
#   nome_produto = MASS[@store_id]['produtos'][produto]['nome']
#   @quantidade_apos_alterar = @app.carrinho.alterar_quantidade_produto(operador, quantidade, nome_produto)
#   @carrinho_model.add_produto(nil, (@quantidade_apos_alterar.to_i - 1))
# end

# Então("o valor total do produto no carrinho deve estar correto") do
#   @app.carrinho.validar_valor_total
# end

# Então("o valor subtotal do carrinho deve estar correto") do
#   @app.carrinho.validar_subtotal_por_produtos
# end

# Quando("eu clicar para limpar o carrinho") do
#   @app.carrinho.remover_produto_mini_cart
# end

# Então("não terá nenhum produto no carrinho") do
#   @app.carrinho.page.has_no_css?('div.minicart-product__wrapper-flex > button')
# end

# Quando("clicar para limpar minha sacola") do
#   @app.carrinho.button_remove_primeiro_item.click
# end

# Então("exibirá mensagem que meu carrinho esta vazio") do
#   @app.carrinho.label_sacola_vazia
# end

# Quando("eu remover o primeiro produto") do
#   @app.carrinho.button_remove_primeiro_item.click
# end

# Então("devo estar na pagina do carrinho populado com no minimo uma linha") do
#   @app.carrinho.label_cart_segundo_produto.visible?.should be true
# end

# Quando("eu clicar em finalizar compra no carrinho") do
#   @app.carrinho.button_finalizar_compra_carrinho.click
# end

# Então("devo visualizar os valores para {string}") do |meio_de_pagamento|
#   @app.carrinho.validar_valores_meio_de_pagamento(meio_de_pagamento)
# end


# Então("produtos serão apresentados no carrinho flutuante") do
#   @carrinho_flutuante = find("#modal-carrinho > div") # DIV do carrinho flutuante 
#   preco = find("div.product-price > div > div.bestValue").text
#   # preco = @produto.preco.to_s # converte float para string
#   # preco = preco.gsub('.', ',') # alteda o preço de . para , 
#   preco = preco.gsub('Por:', '').gsub(' ', '').gsub('R$', '') #Altera o valor de (Por R$ ..) para apenas numerico
#   @carrinho_flutuante.should have_content(preco) # valida se a div carrinho flutuante contém o preço 
#   @carrinho_flutuante.should have_content(@produto.nome) # valida se a div carrinho flutuante contem o nome do produto
# end