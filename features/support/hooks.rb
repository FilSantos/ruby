After do |scenario|

    #adicona a evidencia de tela sempre no final da execução
    add_screenshot(scenario)

    #se falhar, adiciona os log do browser
    if scenario.failed?
        add_browser_logs
    end
 end

 def add_screenshot(scenario)
    #remove do nome do cenario caracteres especiais e espaços
    #para utilizar como nome do arquivo para salvar a evidência
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot = "log/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', scenario.name)
 end

 def add_browser_logs

    # carrega horario local
    time_now = Time.now
    
    # Carrega a URL atual
    current_url = Capybara.current_url.to_s
   
    # Remove mensagens do tipo warnings e info
    logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
    logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
    logs.any? == true

    #adiciona no documento
    embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "URL atual: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'Erro do browser')
end

at_exit do

    # carrega horario local
    time = Time.now

    # configura a geração do relatório
    ReportBuilder.configure do |config|
    config.json_path = 'report.json'
    config.report_path = 'cucumber_web_report'
    config.report_types = [:html]
    config.report_tabs = %w[Detalhes da execução]
    config.report_title = 'Relatório de execução'
    config.compress_images = false
    config.additional_info = { 'Projeto' => 'Test', 'Ambiente' => 'Integrado', 'Gerado em ' => time }
    ReportBuilder.build_report    
    end
end