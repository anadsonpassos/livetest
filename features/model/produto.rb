# Classe Produto que deve conter toda a informação do produto que será utilizado no teste
class Produto

  # Nome do produto
  attr_accessor :nome
  # Descrição do produto
  attr_accessor :descricao
  # Cor do produto
  attr_accessor :cor
  # Tamanho do produto
  attr_accessor :tamanho
  # Marca do Produto
  attr_accessor :marca
  # Tipo de unidade do produto (caixa, frasco, garrafas etc.)
  attr_accessor :unidade
  # Unidades contidas no produto (exemplo caixa com 10 unidades o valor do campo deve ser == 10)
  attr_accessor :unidade_quantidade
  # Indicações do produto
  attr_accessor :indicacoes
  # Boolean indicando se o produto é produzido
  attr_accessor :produzido
  # Quantidade do produto em estoque Hash[distribuidor][quantidade]
  attr_accessor :estoque_quantidade
  # Boolean indicando se o produto foi avaliado
  attr_accessor :avaliado
  # Categoria do produto
  attr_accessor :categoria
  # Subcategoria do produto
  attr_accessor :subcategoria
  # ean do produto
  attr_accessor :ean
  # Distribuidores que vendem o produto
  attr_accessor :distribuidores
  
  # Construtor padrão
  def initialize(store_id)
    @nome = "Corretivo Soft New"
    @preco = "21,12"
    @produzido = true
    @unidade_quantidade = 1
    @marca = "Surf"
    @estoque_quantidade = 1
    @ean = "7891150019249"
    @quantidade = 1
    @distribuidores = Array.new
    @store_id = store_id
  end
  
  # Construtor com nome, sku, preco e quantidade 
  def self.new_produto(store_id, nome, sku, preco, quantidade)
    @store_id = store_id
    @nome = nome
    @preco = preco
    @produzido = true
    @unidade_quantidade = 1
    @marca = ""
    @estoque_quantidade = 1
    @ean = ean
    @quantidade = quantidade
  end
  
  # Retorna o preço do produto (já arredondado) (valor unitario)
  # ====== @return
  #  preco (float)
  def preco
    return @preco.ceil(2)
  end
  
  # Seta o preço do produto
  # ====== @params
  # * +preco+ - Type: String - pode estar fora do formato (conter "R$"" ou ",").
  def preco=(preco)
    @preco = preco.to_s.delete("R$").delete(" ").gsub(",", ".").to_f
  end
  
  # Retorna o preço do produto no carrinho (preço do produto X quantidade do mesmo no carrinho)
  # ====== @return
  #  preco do produto no carrinho (float)
  def preco_no_carrinho
    return (@preco * quantidade).round(2)
  end
  
  # Retorna o preço do produto por Unidade (caixa com 10 == preco individual / unidades contidas na caixa)
  # ====== @return
  #  preco (float)
  def preco_unitario
    return preco / unidade_quantidade
  end
  
  # Verifica se o produto possui estoque
  # ====== @return
  #  true - possui estoque
  #  false - não possui estoque
  def estoque? 
    return estoque_quantidade > 0 ? true : false
  end
  
  # Seta a quantidade do produto
  # ====== @params
  # * +quantidade+ - Type: Integer - Quantidade a ser adicionado do produto
  def quantidade=(quantidade)
    @quantidade += quantidade.to_i
  end
  
  # Retorna a quantidade atual do produto
  # ====== @return
  #  quantidade - Type: Integer
  def quantidade
    return @quantidade.to_i
  end

end