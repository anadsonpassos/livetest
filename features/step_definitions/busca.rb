Quando(/^eu buscar o produto com nome "([^"]*)"$/) do |produto|
  @produto = Produto.new(@store_id)
  @produto.nome=(MASS[@store_id]['produtos'][produto]['nome'])
  @app.busca.realizar_busca(@produto.nome) 
end


Então(/^devo estar na tela de busca valida$/) do
    @app.busca.label_resultado_busca.text.should include(@produto.nome)
end