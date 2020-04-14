#language: pt
#utf-8

@checkout @carrinho @carrinho @appVersion 
Funcionalidade: Carrinho
  Eu como cliente da americanas
  desejo utilizar a funcionalidade de compra
  para isso é necessário que todas as funcionalidades
  de checkout estejam funcionando

Contexto: Acessar a loja
  Dado que eu esteja na home do site 

@positivo @americanas @regressao
Cenário: Validar que o produto foi adicionado corretamente ao carrinho
  Quando adicionar um produto no carrinho
  Então produtos serão apresentados no carrinho

@positivo @americanas @regressao
Cenário: Validar quantidade de item no carrinho flutuante
  Quando adicionar um produto no carrinho
  Então devo visualizar item no carrinho flutuante