# creditas


## Objetivo
    O objetivo deste repositorio é atender a solicitação dos entrevistadores para demonstrar o conhecimento na linguagem Ruby, utilizando as gems abaixo:
    - Selenium
    - Capybara
    - HTTParty
    - Cucumber
    - SitePrism
    - ReportBuilder

    Especificamente nos testes de Web foi utilizado o conceito de page objects.

## Execução dos testes

### 1. Teste de API
`cucumber -t @api`

### 2. Validação de nova aba
`cucumber -t @novaAba`

### 3. Validação de presença de objetos na tela
`cucumber -t @objeto`

### 4. Execução de todos os testes
`cucumber -t ~@creditas`
* Estou passando a tag de exceção da tag creditas porque não foi realizado a codificação dos steps em ruby.

## Escrita dos testes
* Favor verificar dentro da pasta features o arquivo:
`creditasAcesso.feature`

## Autor
Filipe Santos
11 96778-7606 | filsantos1984@gmail.com