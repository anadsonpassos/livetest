Quando(/^eu buscar o produto com nome "([^"]*)"$/) do |produto|
  @produto = Produto.new(@store_id)
  @produto.nome=(MASS[@store_id]['produtos'][produto]['nome'])
  @produto.preco=(MASS[@store_id]['produtos'][produto]['preco'])
  @app.busca.realizar_busca(@produto.nome)
end

Então(/^devo estar na tela de busca valida$/) do
  @app.busca.label_resultado_busca.should have_content(@produto.nome) 
end

# Quando("eu buscar o produto inválido com nome {string}") do |produto|
#   @app.busca.realizar_busca(produto) 
# end

Então(/^devo estar na tela de busca invalida$/) do
  @app.busca.label_resultado_busca_invalida.visible?.should be true
end

# Quando(/^validar o link de Home$/)do
#   @app.busca.validar_link_home
# end

# Então("devo estar na tela Home") do
#   @app.busca.label_banner_principal.visible?.should be true
# end

# Quando("procurar produto com texto {string}") do |produto|
#   @app.busca.realizar_busca(produto)
# end

# Então("devo estar na tela de busca valida com produto") do
#   @app.busca.label_resultado_busca.visible?.should be true
# end

# Quando(/^selecionar o ordenador "([^"]*)"$/) do |ordenador|
#   @produtos = Array.new
#   @app.busca.wait_until_label_primeiro_produto_visible
#   @produtos << @app.busca.label_primeiro_produto.text unless @produtos.include?(@app.busca.label_primeiro_produto.text)
#   @url = URI.parse(current_url)
#   @produtos << @app.busca.selecionar_filtro(ordenador)
#   sleep(1)
# end

# Então(/^valido que o filtro foi aplicado$/) do
#   if @url.to_s != (URI.parse(current_url)).to_s
#     msg = 'Primeiros produtos da lista não foram alterados ao mudar os filtros nessa busca!'
#     warn(msg) unless @app.busca.validar_filtro_aplicado(@produtos)
#   else
#     fail("URL não alterada era e é: " + @url.to_s)
#   end
# end
