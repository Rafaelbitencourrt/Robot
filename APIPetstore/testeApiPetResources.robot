*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${URL_API}        https://petstore.swagger.io/v2/

*** Keywords ***
Criar um novo usuário
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}     ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na PetStore
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary    
    ...        username=Rafa
    ...        firstName=Bitencourt
    ...        lastName=Oliveira   
    ...        email=${email}    
    ...        password=1234
    ...        phone=99899989998
    ...        administrador=true
    Log    ${body}

    ${resposta}    POST On Session    
    ...            alias=PetStore
    ...            url=/user
    ...            json=${body}
    ...            expected_status=${status_code_desejado}
    Log    ${resposta.json()}

Conectar a minha API
    Create Session    PetStore    ${URL_API}
    ${HEADERS}    Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}
