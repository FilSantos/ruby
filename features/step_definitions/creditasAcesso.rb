principal = PaginaPrincipal.new
login = Login.new

Dado("que estou na página de acesso") do
    #Acessa o site da Creditas
    visit('http://www.creditas.com.br')    
    #Clica no acesso do site
    principal.entrar.click
  end
  
  Quando("utilizo as credenciais {string} e {string}") do |usuario, senha|
    #Informo o usuario
    login.usuario.set usuario
    login.entrar.click
    #Informo a senha
    login.senha.set senha
    login.continuar.click
  end
  
  Então("devo ser autenticado com sucesso") do
    #clico no botao continuar para validar que está tudo funcionando corretamente
    expect(login.has_erroAcesso?).to eq(false)

  end
  
  Então("será exibido mensagem {string}") do |mensagem|
    expect(login.erroAcesso.text).to eq(mensagem)
  end
  
  Quando("utilizo o nome de usuário {string}") do |usuario|
      
    #Informo o usuario
      login.usuario.set usuario
      login.entrar.click
      login.continuar.click
  end
  