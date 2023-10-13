*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar um novo usuário
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}     ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    ${body}    Create Dictionary    
    ...        nome=Rafa Bitencourt    
    ...        email=${EMAIL_TESTE}    
    ...        password=1234    
    ...        administrador=true
    Log    ${body}
    Criar seção na ServeRest
    ${resposta}    POST On Session    
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${body}
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar seção na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    ServeRest    url=https://serverest.dev/    headers=${headers}

Conferir se usuário foi cadastradado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message     Cadastro realizado com sucesso