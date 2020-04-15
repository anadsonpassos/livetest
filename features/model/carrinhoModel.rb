# Modelo de carrinho que deve conter todas as alterações no carrinho durante testes de Ckout
class CarrinhoModel 

  # Lista de produtos do carrinho - Array[ Produto ]
  attr_accessor :produtos
  # Lista de distribuidores do carrinho Array[ Distribuidor ]
  attr_accessor :distribuidores
  # Descontos que serão aplicados no carrinho
  attr_accessor :descontos
  # Url usada para navegar no carrinho adicionando produtos
  attr_accessor :url
  
  # Contrutor padrão
  def initialize(store_id, cart_prefix)
    @descontos = 0
    @produtos = Array.new
    @distribuidores = Array.new
    @frete = 0.0
    @store_id = store_id
    @cart_prefix = cart_prefix
  end
  
  def frete=(valor)
    @frete += valor 
  end
  
  def frete
    if @frete == 0.0
      return "Grátis"
    else
      return @frete
    end
  end
  
  # Retorna o valor do subtotal do modelo de carrinho que foi construido
  # ====== @return
  #  subtotal (float)
  def subtotal
    @subtotal = 0
    @produtos.each do |produto|
      @subtotal += produto.preco * produto.quantidade
    end
    return @subtotal.to_f
  end
  
  # Retorna o valor do total do modelo de carrinho que foi construido = subtotal - descontos
  # ====== @return
  #  total (float)
  def total
    subtotal - @descontos.to_f
  end

  # adiciona um produto (Produto.class) na lista de produtos
  # ====== @params
  # * +produto+ - Type: Produto - Produto.class com todos os atributos
  # * +sku+ - Type: String - sku do produto para verificar se ele ja foi inserido na lista e icrementar a quantidade
  # * +produtos+ - Type: Integer - Quantidade desse produto que deve ser inserido na lista
  # ====== @return
  #  -1 - produto novo inserido no carrinho
  #  1 - produto já estava presente no carrinho (quantidade) apenas incrementado
  def add_produto(produto, quantidade)
    r = -1
    @produtos.each do |p|
      if (p.produto == produto)
        r = 1
        p.quantidade=(quantidade.to_i)
      end
    end
    if (r == -1)
      produtos << produto
    end
    return r
  end

  # Retorna um produto Produto da lista de produtos
  # ====== @params
  # * +sku+ - Type: String - sku do produto que deseja retornar
  # ====== @return
  #  -1 - nenhum produto encontrado
  #  Produto - Type: Produto
  def get_produto_por_sku(sku)
    r = -1
    @produtos.each do |p|
      if (p.sku == sku)
        r = p
      end
    end
    return r
  end

  # Seta a url do carrinho adicionando os skus de acordo com a massa que quiser
  # ====== @params
  # * +massa+ - Type: String - massa a utilizar para criar o carrinho adicionando os produtos
  # * +url+ - Type: String - url do carrinho com addSku=sku
  def set_url_add_itens_por_massa(massa, url)
    skus = ""
    massa.each do |produto, quantidade|
      skus += "{" + MASS[@store_id]['produtos'][produto.to_s]['sku'] + ","
      skus += quantidade.to_s + ",}"
      add_produto_por_massa(produto.to_s, quantidade)
    end 
    @url = url.gsub("skus", skus).gsub("{cart_prefix}", @cart_prefix).gsub("{store_id}", @store_id)
  end

  # Seta a url do carrinho adicionando os skus de acordo com a quantidade de produtos especificada
  # ====== @params
  # * +massa+ - Type: String - massa a utilizar para criar o carrinho adicionando os produtos
  # * +url+ - Type: String - url do carrinho com addSku=sku
  def url_add_itens_por_quantidade(qnt, url)
    skus = ""
    for i in 1..qnt  
      skus += "{" + MASS[@store_id]['produtos']['produto_valido_' + i.to_s]['sku'] + ","
      skus += "1,}"
      add_produto_por_massa('produto_valido_' + i.to_s, 1)
    end 
    @url = url.gsub("skus", skus)
    @url = @url.gsub("{cart_prefix}", @cart_prefix)
  end

  # Adiciona o produto produto de acordo com a massa e quantidade
  # ====== @return
  # * +produto+ - Type: String - massa a utilizar para criar o carrinho adicionando os produtos
  # * +quantidade+ - Type: String - quantidade a ser adicionada no produto >= 1
  def add_produto_por_massa(produto, quantidade)
    p = Produto.new(@store_id)
    p.nome=(MASS[@store_id]['produtos'][produto]['nome'])
    p.sku=(MASS[@store_id]['produtos'][produto]['sku'])
    p.preco=(MASS[@store_id]['produtos'][produto]['preco'])
    p.quantidade=(quantidade-1)
    add_produto(p, p.sku, quantidade)
  end

  # Adiciona um distribuidor a lista de distribuidores (caso já exista não adiciona)
  # ====== @params
  # * +distribuidor+ - Type: Distribuidor - distribuidor para ser adicionado a lista
  # ====== @return
  # * -1 - distribuidor não adicionado
  # * 1 - distribuidor adicionado 
  def add_distribuidor(distribuidor)
    r = -1
    @distribuidores.each do |d|
      if (d.id == distribuidor.id)
        r = 1
      end
    end
    if (r == -1)
      distribuidores << distribuidor
    end
    return r
  end

  # Seta a url do carrinho adicionando os skus de acordo com a massa que quiser
  # ====== @params
  # * +massa+ - Type: String - nome da massa de distribuidor
  # ====== @return
  # * -1 - distribuidor não adicionado
  # * 1 - distribuidor adicionado 
  def add_distribuidor_por_massa(massa)
    d = Distribuidor.novo_distribuidor(@store_id, massa)
    return add_distribuidor(d)
  end

  # Seta a url do carrinho adicionando os skus de acordo com a massa que quiser
  # ====== @params
  # * +id+ - Type: int - id do distribuidor que deseja buscar
  # ====== @return
  # * -1 - não encontrado
  # * distribuidor - Type: Distribuidor
  def get_distribuidor_by_id(id)
    r = -1
    @distribuidores.each do |d|
      if (d.id == id)
        r = d
      end
    end
    return r
  end
  
  end