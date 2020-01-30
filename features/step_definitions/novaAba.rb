aba = NewPage.new

Dado("que estou na página de solicitar nova aba") do
    #Acessa o site
    visit('https://the-internet.herokuapp.com/windows')   
  end
  
  Quando("abrir para abrir nova aba") do
    antes = page.driver.browser.window_handles.size
    aba.novaAba.click
    depois = page.driver.browser.window_handles.size
    expect(depois).to eq(antes + 1)
  end
  
  Então("valido a existencia de nova aba e se está na URL correta") do
    window = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(window.last)
    expect("https://the-internet.herokuapp.com/windows/new").to eq(Capybara.current_url.to_s)
  end
  