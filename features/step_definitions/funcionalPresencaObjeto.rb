control = DynamicControls.new

  Dado("que estou na página de validação do componente checkbox") do
        #Acessa o site
        visit('https://the-internet.herokuapp.com/dynamic_controls')    
  end
  
  Quando("o botão Remove estiver presente") do
    expect(control.botao.text).to eq("Remove")
    
  end
  
  Então("deve ser exibido o checkbox A checkbox") do
    expect(control.has_checkbox?).to eq(true)
  end
  
  Quando("{string} o checkbok na página") do |acao|
    
    if acao.eql? "não existir"
        control.botao.click
        expect(control.mensagem.text).to eq("It's gone!")
    end
    
    existeCheckbox = acao.eql? "existir"

    expect(control.has_checkbox?).to eq(existeCheckbox)
  
end
  
  Então("{string} o checkbox") do |acao|
    
    remove = acao.eql? "removerá"

    if remove
        expect(control.botao.text).to eq("Remove")
    else
        expect(control.botao.text).to eq("Add")
    end

    control.botao.click

    expect(control.has_checkbox?).to eq(remove == true)

  end
  
  Então("exibirá o botão {string}") do |acao|
    expect(control.botao.text).to eq(acao)
    
    if acao.eql? "Remove"
        expect(control.mensagem.text).to eq("It's gone!")
    end
    
  end
  
  Então("{string} o checkbok") do |acao|

    existeCheckbox = acao.eql? "removerá"
    control.botao.click
    
    if existeCheckbox
        expect(control.mensagem.text).to eq("It's gone!")
    else
        expect(control.mensagem.text).to eq("It's back!")
    end

    expect(control.has_checkbox?).to eq(existeCheckbox)

  end