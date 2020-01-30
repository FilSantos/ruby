# language: pt
# author: Filipe Santos

@api
Funcionalidade: validar a viabilidade de teste de API
    Para que eu possa demonstrar que é possivel realizar testes de API
    Sendo um sistema
    Posso validar utilizando httparty

Esquema do Cenario: Estado padrão da página - com checkbox
    Quando realizar a inclusão de um POST com "<title>", "<body>", "<userId>" 
    Então o sistema retorna o código 201
    E verifico se os dados "<title>", "<body>", "<userId>" estão corretos

    Exemplos:
    | title | body | userId |
    | the   | week |      2 |