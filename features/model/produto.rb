# Classe Produto que deve conter toda a informação do produto que será utilizado no teste
class Produto

    # Nome do produto
    attr_accessor :nome
    # Marca do Produto
    attr_accessor :marca
    # ean do produto
    attr_accessor :ean

  
    # Construtor padrão
    def initialize(store_id)
      @nome = "mouse sem fio wireless 2.4ghz 1200 dpi usb g22 knup"
      @preco = "30,35"
      @marca = "Knup"
      @ean = "68438683"
      @store_id = store_id
    end
  
    # Construtor com nome, sku, preco e quantidade 
    def self.new_produto(store_id, nome, sku, preco, quantidade)
      @store_id = store_id
      @nome = nome
      @preco = preco
      @marca = ""
      @ean = ean
    end
    
  end