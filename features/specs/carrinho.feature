#language: pt
#utf-8

@checkout @carrinho @appVersion 
Funcionalidade: Carrinho
  Eu como cliente da dailus
  desejo utilizar a funcionalidade de compra
  para isso é necessário que todas as funcionalidades
  de checkout estejam funcionando

Contexto: Adicionar produtos no carrinho
  Dado que eu esteja na home do site 
  #Quando eu faço login com "cliente_1"

@positivo @dailus @regressao
Cenário: Validar que o produto foi adicionado corretamente ao carrinho
  Quando adicionar um produto no carrinho
  Então produto deve ser apresentado no carrinho

# @positivo @dailus @regressao
# Cenário: Validar que é possivel inserir a quantidade de produtos
#   Quando adicionar dois produto no carrinho
#   E alterar a quantidade do produto "produto_valido_2" para 7
#   Então a quantidade do "produto_valido_2" tera sido alterada para o valor "7"

# @positivo @dailus @regressao
# Cenário: Validar que o valor total muda ao alterar a quantidade de itens 
#   Quando adicionar dois produto no carrinho
#   E alterar a quantidade do produto "produto_valido_1" para 3
#   Então a quantidade do "produto_valido_1" tera sido alterada para o valor "3"
#   E o valor do produto deve ser 3 vezes o valor unitario do produto "produto_valido_1"

# @positivo @dailus @regressao
# Cenário: Validar que alterar a quantidade altera o valor total do produto no carrinho
#   Quando adicionar dois produto no carrinho
#   Quando alterar para "+" a quantidade do produto "produto_valido_1" em "1" vezes
#   Então a quantidade do "produto_valido_1" tera sido alterada para o valor "2"
#   E o valor total do produto no carrinho deve estar correto

# @positivo @dailus @regressao
# Cenário: Validar que o valor Subtotal do carrinho está correto
#   Quando adicionar dois produto no carrinho
#   Então o valor subtotal do carrinho deve estar correto

# @positivo @dailus @regressao
# Cenário: Limpar carrinho
#   Quando adicionar um produto no carrinho
#   E eu clicar para limpar o carrinho
#   Então não terá nenhum produto no carrinho

# @positivo @dailus @regressao
# Cenário: Limpar minha sacola
#   Quando adicionar um produto no carrinho
#   E clicar para limpar minha sacola
#   Então exibirá mensagem que meu carrinho esta vazio

# @positivo @dailus @regressao
# Cenário: Remover item do carrinho
#   Quando adicionar dois produto no carrinho
#   E eu remover o primeiro produto
#   Então devo estar na pagina do carrinho populado com no minimo uma linha

# @positivo @dailus @regressao
# Cenário: Validar Formas de Pagamento - Boleto Bancário
#   Quando adicionar dois produto no carrinho
#   E eu clicar em finalizar compra no carrinho
#   Então devo visualizar os valores para "Boleto Bancário"

# @positivo @dailus @testap1
# Cenário: Realizar compra - Boleto Bancário
#   Quando adicionar dois produto no carrinho
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento boleto bancario
#   E devo visualizar os valores para "Boleto Bancario"
#   E aceitar os termos e condicoes
#   E confirmar o pagamento
#   Então estarei na página de confirmação de pedido

# @positivo @dailus
# Cenário: Realizar compra - Boleto Faturado
#   Quando adicionar dois produto no carrinho
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento boleto faturado
#   E selecionar a opcao de boleto faturado "2"
#   E aceitar os termos e condicoes
#   E confirmar o pagamento
#   Então estarei na página de confirmação de pedido

# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Realizar compra - Cartão de Crédito
#   Quando adicionar dois produto no carrinho
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento cartao de credito
#   E preencher os campos do cartao de credito utilizando os dados de <bandeira>
#   E aceitar os termos e condicoes
#   E confirmar o pagamento
#   Então estarei na página de confirmação de pedido

#   Exemplos:
#   | bandeira      |
#   | "mastercard"  |
#   | "visa"        |
#   | "diners_club" |
#   | "amex"        |

# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Validar alteração de quantidade usando os botões de quantidade
#   Quando adicionar dois produto no carrinho
#   E alterar para <operador> a quantidade do produto <produto> em <vezes> vezes
#   E a quantidade do <produto> tera sido alterada para o valor <quantidade>

#   Exemplos:
#   | operador      | vezes         | quantidade | produto            |
#   | "+"           | "1"           | "2"        | "produto_valido_1" |
#   | "+/-"         | "4/2"         | "3"        | "produto_valido_1" |
#   | "+/-/+/-/+/-" | "3/2/4/2/2/1" | "5"        | "produto_valido_1" |

# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Validar que a seção x do EasyCheckout está presente
#   Quando adicionar dois produto no carrinho
#   Então devo ver o <validacao> do EasyCheckout

#   Exemplos:
#   | validacao |
#   | header |
#   | footer |

# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Validar (breadcrumb) não realiza nenhuma ação.
#   Quando adicionar dois produto no carrinho
#   E verifico os breadcrumb carrinho, pagamento e confirmacao
#   Então devo ver o carrinho sem alteracao

#   Exemplos:
#   | breadcrumb |
#   | carrinho |
#   | pagamento |
#   | confirmacao |

# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Validar dados de Identificacao
#   Quando adicionar dois produto no carrinho
#   Quando alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   E as informacoes de <validacao> da empresa devem estar corretas

#   Exemplos:
#   | validacao     |
#   | identificacao |
#   | endereco      |

# @negativo @esquemaCenario @dailus
# Esquema do Cenário: Validar impossibilidade de finalizar com dados invalidos
#   Quando adicionar dois produto no carrinho
#   # E alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento <meio_de_pagamento>
#   E aceitar os termos e condicoes
#   E preencher <meio_de_pagamento> utilizando dados de <bandeira> e campo <campo> <preenchimento>
#  #E confirmar o pagamento
#   Entao devera ser exibido mensagem <msg_validacao>

#   Exemplos:
#   | meio_de_pagamento | bandeira | campo              | preenchimento | msg_validacao                                        |
#   | cartao de credito | "visa"   | "numero"           | "vazio"       | "Digite o número do cartão de crédito."              |
#   | cartao de credito | "visa"   | "nome"             | "vazio"       | "Digite o nome do dono do cartão de crédito."        |
#   | cartao de credito | "visa"   | "cpf_cnpj"         | "vazio"       | "Digite o CPF/CNPJ do Titular do Cartão."            |
#   | cartao de credito | "visa"   | "validade_mes"     | "vazio"       | "Selecione o mês de validade do cartão de crédito"   |
#   | cartao de credito | "visa"   | "validade_ano"     | "vazio"       | "Selecione o ano de validade do cartão de crédito"   |
#   | cartao de credito | "visa"   | "codigo_seguranca" | "vazio"       | "Digite o código de segurança do cartão de crédito." |
#   | cartao de credito | "visa"   | "numero"           | "incorreto"   | "Número do cartão de crédito é inválido."            |
#   #| cartao de credito | "visa"   | "nome"             | "incorreto"   | "nome_invalido"                                      |
#   #| cartao de credito | "visa"   | "codigo_seguranca" | "incorreto"   | "Digite o código de segurança do cartão de crédito." |
#   #| cartao de credito | "visa"   | "validade_mes"     | "incorreto"   | "data_de_vencimento_cartao_invalido"                 |
  
# @positivo @esquemaCenario @dailus
# Esquema do Cenário: Validar seu carrinho na tela de pagamento
#   Quando adicionar dois produto no carrinho
#   E alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   E <obj_validacao> deve ser exibido corretamente

#   Exemplos:
#   | obj_validacao |
#   | subtotal |
#   | frete |
#   | total |

# @positivo @dailus
# Cenário: Refazer pedido a partir da home
#   Dado que eu finalize um pedido
#   E que eu esteja na home do site 
#   Quando eu clicar em "refazer_pedido_home"
#   E eu selecionar a opção Número do Pedido com "pedido_1"
#   E selecionar o primeiro pedido na lista
#   E clicar no link "Abrir" do pedido
#   E eu clicar em "refazer_pedido"
#   E clicar para ir para o carrinho
#   Então devo validar se as informações do pedido estão corretas

# @positivo @dailus
# Cenário: Descartar produtos a partir da tela de carrinho
#   Quando adicionar um produto no carrinho
#   E produto deve ser apresentado no carrinho
#   E eu clicar em descartar produtos
#   Então devo visualizar mensagem de carrinho vazio

# @positivo @dailus
# Cenário: Adicionar mais produtos a partir da tela de carrinho
#   Quando adicionar um produto no carrinho
#   E produto deve ser apresentado no carrinho
#   E eu clicar em adicionar mais produto
#   Dado que eu esteja na home do site

# @positivo @dailus
# Cenário: Realizar compra - Contra-Entrega
#   Quando adicionar dois produto no carrinho
#   E alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento contra-entrega
#   E aceitar os termos e condicoes
#   E confirmar o pagamento
#   Então estarei na página de confirmação de pedido

# @positivo @dailus
# Cenário: Realizar compra - Boleto
#   Quando alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento baloto
#   E aceitar os termos e condicoes
#   E confirmar o pagamento
#   Então estarei na página de confirmação de pedido

# @negativo @esquemaCenario @dailus
# Esquema do Cenário: Validar impossibilidade de compra sem aceitar termos de uso
#   Quando alterar a quantidade para que o valor seja superior ao valor minimo
#   E eu clicar em continuar no carrinho
#   Então devo estar na pagina de pagamento
#   Quando selecionar o meio de pagamento <meio_de_pagamento>
#   E confirmar o pagamento
#   Entao devera ser exibido mensagem <msg_validacao>

#   Exemplos:
#   | meio_de_pagamento | msg_validacao |
#   | contra-entrega | "nao_aceitar_termos" |
#   | baloto | "nao_aceitar_termos" |
#   | sured | "nao_aceitar_termos" |