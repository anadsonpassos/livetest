class Comum < SitePrism::Page
  @@store_id = 'DAILUS'

element :label_error_pass_acc, :css,''
element :input_sucesso_esqueceu_senha, :css, ''
element :mensagem_floatcart, :css, ''
element :mensagem_cadastro, :css, ''
element :label_sucesso_novo_cadastro, :css, ''
element :mensagem_alerta_email, :css, ''
element :mensagem_busca, :css, 'section.section.section--emptysearch > div > h2'

  def valida_campo_moeda(elemento)
    elemento.text.should include("$")
  end

  def valida_mensagem(mensagem, cenario)
    #label_error_pass_acc.text.should be == mensagem
    case cenario
      when "login"
        label_error_pass_acc.text.should have_content mensagem
      when "recuperar_senha"
        input_sucesso_esqueceu_senha.text.should have_content(mensagem)
      when "busca"
        mensagem_busca.text.should have_content(mensagem)
      when "carrinho flutuante"
        mensagem_floatcart.should have_content(mensagem)     
      when "cadastro_erro"
        mensagem_cadastro.text.should have_content(mensagem)   
      when "cadastro_sucesso"
        label_sucesso_novo_cadastro.text.should have_content(mensagem)
      when "newsletter"
        mensagem_alerta_email.text.should have_content(mensagem)
    end
  end

  def exists?(selector, path, matcher, wait_time)
    sleep(wait_time)
    r = false
    if (selector.upcase == "CSS")
      if matcher.has_css?(path)
        r = true
      else
        r = false
      end
    end
    if (selector.upcase == "XPATH")
      if matcher.has_css?(path)
        r = true
      else
        r = false
      end
    end
    return r
  end
end