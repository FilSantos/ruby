# language: pt
# author: Filipe Santos

@novaAba
Funcionalidade: validar que foi aberto nova aba no  browser
    Para que eu possa a abertura de nova aba no browser
    Sendo um sistema
    Posso verificar a abertura e o URL correta da nova aba

Cenario: Estado padrão da página - com checkbox
    Dado que estou na página de solicitar nova aba
    Quando abrir para abrir nova aba
    Então valido a existencia de nova aba e se está na URL correta 