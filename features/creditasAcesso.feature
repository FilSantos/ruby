# language: pt
# author: Filipe Santos

@creditas
Funcionalidade: Acessar a solicitação de emprestimo
    Para que eu possa acompanhar a solicitação de emprestimo dos clientes
    Sendo um usário
    Posso acessar o sistema com meu cpf ou e-mail e senha previamente cadastrados

Contexto: Página inicial
    Dado que estou na página de acesso

Esquema do Cenario: Validar acesso válido
    Quando utilizo as credenciais "<usuario>" e "<senha>"
    Então devo ser autenticado com sucesso

    Exemplos:
    |usuario                  | senha |
    | 318.411.408-21          | Senha |
    | filsantos1984@gmail.com | Senha |


Esquema do Cenario: Validar acesso inválido
    Quando utilizo as credenciais "<usuario>" e "<senha>"
    Então será exibido mensagem "Acesso inválido"

    Exemplos:
    | usuario        | senha  |
    | 791.579.128-15 | Senha1 |
    | joao@joao.com  | Senha1 |

Esquema do Cenario: Validar mascara do usuário
    Quando utilizo o nome de usuário "<usuario>" 
    Então será exibido mensagem "Informe corretamente os dados do usuário"

    Exemplos:
    | usuario        |
    | 79157912815    |
    | joao           |
    | @joao          |
    | joao@joao      |