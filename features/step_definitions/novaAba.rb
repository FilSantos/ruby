aba = NewPage.new

Dado("que estou na página de solicitar nova aba") do
    #Acessa o site
    visit('https://the-internet.herokuapp.com/windows')   
  end
  
  Quando("abrir para abrir nova aba") do

    #verifica a quantidade de abas abertas no momento
    antes = page.driver.browser.window_handles.size
    aba.novaAba.click
    
    #verifica a quantidade de abas abertas no momento
    depois = page.driver.browser.window_handles.size
    
    #compara se a quantidaed de abas está correa (1 nova)
    expect(depois).to eq(antes + 1)
  end
  
  Então("valido a existencia de nova aba e se está na URL correta") do
    #troca para a ultima aba
    window = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(window.last)

    #verifica se a url está correta
    expect(Capybara.current_url.to_s).to eq("https://the-internet.herokuapp.com/windows/new")
  end
  