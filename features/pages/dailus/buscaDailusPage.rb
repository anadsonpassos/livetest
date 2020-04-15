class BuscaDailus < SitePrism::Page
  @@store_id = 'DAILUS'

  # label
  element :label_resultado_busca, :css, 'li:nth-child(1) > div > div.product__info > div.product__info-name > h3'
  element :label_banner_principal, :css, 'section.section.section--banner-full'
  element :label_resultado_busca_invalida, :css, ' section.section.section--emptysearch > div > h2'
  element :label_primeiro_produto, :css, ':nth-child(1) > div > div.product__info > div.product__info-name > h3'

  #link
  element :link_home, :css, 'section.section.section--catalog-header > div > div > ul > li:nth-child(1) > a'

  # input
  element :input_barra_de_busca, :css, 'div.header__search.col-lg-7.hide--mobile > div > div.search-form > form > div > input'

  # button
  element :button_boas_vindas, :css, 'div.modal-boas-vindas__content.lightbox__modal > button'

  # select
  element :select_ordenar_por, :css, 'div.custom-order-by > button'

  def realizar_busca(produto)
    input_barra_de_busca.set produto
    input_barra_de_busca.native.send_keys(:return)
  end

  def validar_link_home
    link_home.click
  end

  # def selecionar_filtro(filtro)
  #   select_ordenar_por.click
  #   filtros = page.all('.custom-order-by')
  #   filtros.each do |f|
  #     if f.text.upcase == filtro.upcase
  #       f.click
  #     end
  #   end
  #   sleep(2)
  #   return label_primeiro_produto.text
  # end


  # def validar_filtro_aplicado(produtos)
  #   r = true
  #   aux = ""
  #   for i in 0..(produtos.size - 1)
  #     for j in (i + 1)..produtos.size
  #       if produtos[i] == produtos[j]
  #         r = false
  #       end
  #     end
  #   end
  #   return r
  # end


end