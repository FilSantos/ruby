# language: pt
# author: Filipe Santos

@objeto
Funcionalidade: validar a verificação funcional da presença de objeto
    Para que eu possa demonstrar que é possivel verificar a presença do checkbox A checkbox
    Sendo um sistema
    Posso verificar com baixo esforço a presença de um objeto

Contexto: Página inicial
    Dado que estou na página de validação do componente checkbox

Cenario: Estado padrão da página - com checkbox
    Quando o botão Remove estiver presente
    Então deve ser exibido o checkbox A checkbox 

Cenario: Remover checkbox
    Quando "existir" o checkbok na página
    Então "removerá" o checkbox 
    E exibirá o botão "Remove" 

Cenario: Acrescentar checkbox
    Quando "não existir" o checkbok na página
    Então exibirá o botão "Add"
    E "acrescentará" o checkbok