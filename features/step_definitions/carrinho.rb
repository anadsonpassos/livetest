Quando("adicionar um produto no carrinho") do
    @produto = Produto.new(@store_id)
    @app.busca.realizar_busca(@produto.nome)
    @app.carrinho.adicionar_produto_carrinho
end

Então("produtos serão apresentados no carrinho") do
    @app.carrinho.validar_produto_carrinho
end

Então('devo visualizar item no carrinho flutuante') do
    @app.carrinho.validar_item_carrinho_flutuante
end