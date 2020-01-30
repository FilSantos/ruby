control = DynamicControls.new

  Dado("que estou na página de validação do componente checkbox") do
        #Acessa o site
        visit('https://the-internet.herokuapp.com/dynamic_controls')    
  end
  
  Quando("o botão Remove estiver presente") do
    #Verifica se o botão é de remoação
    expect(control.botao.text).to eq("Remove")
    
  end
  
  Então("deve ser exibido o checkbox A checkbox") do
    #verifica se o checkbox está disponivel na tela
    expect(control.has_checkbox?).to eq(true)
  end
  
  Quando("{string} o checkbok na página") do |acao|
    
    #se acao for de não existir, deve se deixar a pagina sem checkbox
    if acao.eql? "não existir"
        control.botao.click
        expect(control.mensagem.text).to eq("It's gone!")
    end
    
    existeCheckbox = acao.eql? "existir"
    
    #verifica se o checkbox deve ou nao estar presente na tela
    expect(control.has_checkbox?).to eq(existeCheckbox)
  
end
  
  Então("{string} o checkbox") do |acao|
    
    #Verifica se o texto do botão está correto.
    remove = acao.eql? "removerá"
    if remove
        expect(control.botao.text).to eq("Remove")
    else
        expect(control.botao.text).to eq("Add")
    end

    #Após clicar no botão, verifica se o a exibição do checkbox está correta
    control.botao.click
    expect(control.has_checkbox?).to eq(remove == true)

  end
  
  Então("exibirá o botão {string}") do |acao|

    #Verifica se a ação do botão foi realizada corretamente
    expect(control.botao.text).to eq(acao)
    
    if acao.eql? "Remove"
        expect(control.mensagem.text).to eq("It's gone!")
    end
    
  end
  
  Então("{string} o checkbok") do |acao|

    existeCheckbox = acao.eql? "removerá"
    control.botao.click
    
    #Verifica se a ação do botão foi realizada corretamente    
    if existeCheckbox
        expect(control.mensagem.text).to eq("It's gone!")
    else
        expect(control.mensagem.text).to eq("It's back!")
    end

    expect(control.has_checkbox?).to eq(existeCheckbox)

  end