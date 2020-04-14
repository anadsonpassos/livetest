class BuscaAmericanas < SitePrism::Page
  @@store_id = 'AMERICANAS'

  # input
  element :input_barra_de_busca, :css, '#h_search-input'

  # label
  element :label_resultado_busca, :css, 'div:nth-child(1) > div > div > h1'

  # button
  element :button_buscar_produto, :css, '#h_search-btn'

  def realizar_busca(produto)
    input_barra_de_busca.set produto
    button_buscar_produto.click
  end

end

