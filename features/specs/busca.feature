#language: pt
#utf-8

@busca @appVersion @catalogo
Funcionalidade: Busca
  Eu como cliente 
  Quero buscar produtos
  Para visualizar mais informações sobre eles

Contexto: Acessar a loja
   Dado que eu esteja na home do site 
          # Quando eu faço login com "cliente_1"
          # Então estarei "logado" no site
 
@positivo @dailus @regressao
Cenário: Realizar Busca Por Um Produto Valido
  Quando eu buscar o produto com nome "produto_valido_1"
  Então devo estar na tela de busca valida

@negativo @negativo @dailus @regressao
Cenário: Realizar Busca Por Um Produto Invalido
  Quando eu buscar o produto com nome "produto_invalido_1"
  Então devo estar na tela de busca invalida


# @esquemaCenario @negativo @dailus @regressao
# Esquema do Cenário: Validar a busca utilizando filtros
#   Quando eu buscar o produto inválido com nome <produto> 
#   Então devo estar na tela de busca invalida
#   Então eu visualizarei a mensagem de <mensagem_saída> no cenário de "busca"

#     Exemplos: 
#       | produto       | mensagem_saída                           |
#       | "aabbcc"      | "Não encontramos nenhum resultado."      |
#       | "PRODUTO123"  | "Não encontramos nenhum resultado."      | 
#       | "@#$%"        | "Não encontramos nenhum resultado."      |
#       | "123456789"   | "Não encontramos nenhum resultado."      |

# @positivo @dailus @regressao
# Cenário: Validar botão Carregar mais produtos
#   Quando eu buscar o produto com nome "produto_valido_2" 
#   E validar o link de Home
#   Então devo estar na tela Home

# @positivo @dailus @regressao
# Cenário: Validar busca com um produto válido e um inválido
#   Quando procurar produto com texto "Esmalte"
#   Então devo estar na tela de busca valida com produto
#   Quando procurar produto com texto "Rexa"
#   Então devo estar na tela de busca invalida

# @esquema_cenario @positivo @dailus @testap
# Esquema do Cenário: Validar a busca utilizando filtros
#   #Quando eu faço login com "cliente_1"
#   Quando eu buscar o produto com nome <produto>
#   E selecionar o ordenador <ordenador>
#   Então valido que o filtro foi aplicado

#   Exemplos:
#   | produto            | ordenador             |
#   | "produto_valido_1" | "Menor preço"         |
#   | "produto_valido_1" | "Maior preço"         |
#   | "produto_valido_1" | "Mais vendidos"       |
#   | "produto_valido_1" | "Melhores avaliações" |