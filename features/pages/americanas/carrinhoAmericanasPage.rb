class CarrinhoAmericanas < SitePrism::Page
    @@store_id = 'AMERICANAS'
  
    # label
    element :label_produto, :css, 'div.row.product-grid.no-gutters.main-grid > div:nth-child(2) > div'
    element :label_produto_carrinho, :css, 'div.basket-products > section > ul > li'
    element :label_sumary_carrinho, :css, 'div.basket-summary > h3'
    element :label_header, :css, 'header > h2'

    # button
    element :button_comprar, :css, '#btn-buy > div'

    # span
    element :quantidade_produto_carrinho, :css, '#h_minicart > a > span'

    # href
    element :logo_loja, :css, '#brd-link > svg.brd-logo.logo'
    element :carrinho_flutuante, :css, '#h_minicart > a > svg'
    element :produto_cart, :css, '#crt-box > ul > li > a'
    
    def adicionar_produto_carrinho
        label_produto.click
        button_comprar.click
    end

    def validar_produto_carrinho
        label_header.visible?.should be true
        page.has_text?('Minha cesta')
        label_produto_carrinho.visible?.should be true
        label_sumary_carrinho.visible?.should be true
        page.has_text?('Resumo do pedido')
    end

    def validar_item_carrinho_flutuante
        logo_loja.click
        carrinho_flutuante.click
        produto_cart.visible?.should be true
    end

end