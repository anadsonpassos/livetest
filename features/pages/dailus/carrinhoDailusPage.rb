class CarrinhoDailus < SitePrism::Page
  @@store_id = 'DAILUS'

 # label
  element :label_primeiro_produto, :css, 'li.categorias-banners__item.slick-slide.slick-current.slick-active'
  element :label_cor, :xpath, '/html/body/main/section[3]/div/div/div/div[2]/div[1]/div[3]/div/ul/li[2]/span/label[1]'
  element :label_produto_header, :css, 'li:nth-child(1) > div > div.product__header > div.product__media > a'
  element :label_segundo_produto, :css, 'div.product__header'
  element :label_valor_primeiro_produto, :css, 'tr:nth-child(1) > td.quantity-price'
  element :label_valor_segundo_produto, :css, 'tr:nth-child(2) > td.quantity-price'
  element :label_sacola_vazia, :css, '#cartLoadedDiv > div.empty-cart-content > h2'
  element :label_cart_segundo_produto, :css, '#cartLoadedDiv > div.cart > table > tbody > tr'
  element :labbel_opcao_boleto, :css, '#payment-group-bankInvoicePaymentGroup'
  element :label_valor_boleto, :css, 'div:nth-child(2) > fieldset > p.sight > span:nth-child(2)'

 # button
  element :button_comprar, :css, '.product__buy > a'
  element :button_quantidade_mais, :css, '#item-quantity-change-increment-200'
  element :button_quantidade_menos, :css, '#item-quantity-change-decrement-200'
  element :button_mini_cart, :css, 'div.header__minicart.col-sm-2.col-lg-1 > div > div > button'
  element :button_remove_item, :css, 'div.minicart-product__wrapper-flex > button'
  element :button_remove_primeiro_item, :css, '#item-remove-200'
  element :button_finalizar_compra, :css, 'span.btn-place-order-wrapper'
  element :button_finalizar_compra_carrinho, :css, '.btn-place-order-wrapper'

  # link
  element :link_continuar_comprando, :css, '#cart-choose-more-products'
  element :link_header_pinceis, :css, 'ul.menu.menu--main > li:nth-child(6) > a'

  # input
  element :input_produto1, :css, '#item-quantity-200'
  element :input_produto2, :css, '#item-quantity-89'
  element :input_barra_de_busca, :css, 'div.header__search.col-lg-7.hide--mobile > div > div.search-form > form > div > input'

  @@valor_unitario = 'tr:nth-child(1) > td.product-price > span.best-price > span.new-product-price'
  @@valores_totais = 'tr:nth-child(1) > td.quantity-price > span.total-selling-price'


  def compra_primeiro_produto_disponível
    link_header_pinceis.click
    label_produto_header.click
    if page.has_css?('.product__buy > a')
      button_comprar.click
    end
  end

  # def adicionar_dois_produto_disponível
  #   link_header_pinceis.click
  #   label_produto_header.click
  #   if page.has_css?('.product__buy > a')
  #     button_comprar.click
  #       if expect(page).to have_css("#cart-choose-more-products")
  #         link_continuar_comprando.click
  #         input_barra_de_busca.set 'Caneta Delineadora - Cat'
  #         input_barra_de_busca.native.send_keys(:return)
  #         label_segundo_produto.click
  #         button_comprar.click
  #       end
  #   end
  # end

  # def alterar_quantidade(produto, quantidade)
  #   case produto
  #   when "produto_valido_1"
  #     input_produto1.set quantidade
  #   when "produto_valido_2"
  #     input_produto2.set quantidade
  #   end
  # end

  # def validar_valor(quantidade)
  #   valor = (@@valor_unitario * quantidade)
  #     if @@valores_totais == valor
  #       true
  #     else
  #       false
  #     end
  # end

  # def alterar_quantidade_produto(operador, quantidade, nome_produto)
  #   nome_produto = find('#product-name200').text
  #   button_quantidade_mais = find("#item-quantity-change-increment-200")
  #   button_quantidade_menos = find("#item-quantity-change-decrement-200")
  #   list_operadores = operador.split("/")
  #   list_quantidades = quantidade.split("/")
  #   x = 0
  #   list_operadores.each do |op|
  #     case op.upcase
  #     when "+"
  #       button = button_quantidade_mais
  #     when "-"
  #       button = button_quantidade_menos
  #     end
  #     for i in 1..list_quantidades[x].to_i
  #       button.click
  #     end
  #     x += 1
  #   end
  #   return get_quantidade_produto_por_nome(nome_produto)
  # end

  # def get_quantidade_produto_por_nome(nome_produto)
  #   input_quantidade_produto = find(:css, "#item-quantity-200")
  #   return input_quantidade_produto[:value].to_i
  # end

  # def validar_valor_total
  #   @@valor_unitario = find('tr:nth-child(1) > td.product-price > span.best-price > span.new-product-price').text
  #   valor_total = find('tr:nth-child(1) > td.quantity-price > span.total-selling-price').text
  #   @@quantidade_produto1 = find('#item-quantity-200')[:value].to_i
  #   @@valor_unitario = @@valor_unitario.gsub('R$ ','').gsub(',','.').to_f
  #   valor_total = valor_total.gsub('R$ ','').gsub(',','.').to_f
  #   total = (@@quantidade_produto1 * @@valor_unitario).to_s
  #   valor_total = total ? true : fail("false") 
  # end

  # def validar_subtotal_por_produtos
  #    @@valor_unitario = find('tr:nth-child(1) > td.product-price > span.best-price > span.new-product-price').text
  #    @@valor_unitario2 = find('tr:nth-child(2) > td.product-price > span.best-price > span.new-product-price').text
  #    @@subtotal = find('div.cart-template.full-cart.span12.active tbody.totalizers-list > tr > td.monetary').text
  #    @@valor_unitario = @@valor_unitario.gsub('R$ ','').gsub(',','.').to_f
  #    @@valor_unitario2 = @@valor_unitario2.gsub('R$ ','').gsub(',','.').to_f
  #    @@subtotal = @@subtotal.gsub('R$ ','').gsub(',','.').to_f
  #    v_subtotal = (@@valor_unitario + @@valor_unitario2)
  #    @@subtotal == v_subtotal ? true : fail("false").to_f
  # end

  # def remover_produto_mini_cart
  #   link_continuar_comprando.click
  #   button_mini_cart.click
  #   button_remove_item.click
  # end

  # def validar_carrinho_vazio
  #   label_sacola_vazia.text.upcase.equal?("Seu carrinho está vazio.")
  # end

  # def validar_valores_meio_de_pagamento(meio_de_pagamento)
  #   array_de_meios = (MASS[@@store_id]['meios_de_pagamento'])
  #   i=0
  #   array_de_meios.each do |key,value|
  #     if meio_de_pagamento == value
  #       break
  #       expect(labbel_opcao_boleto).to have_css(".payment-"+key.to_s)
  #     elsif(i-1 == array_de_meios.length)
  #       fail("Não Existe esta forma de Pagamento")
  #     end
  #   end
  # end

end