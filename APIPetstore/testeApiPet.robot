*** Settings ***
Library     RequestsLibrary
Library           Collections

*** Variables ***
${BaseURL}        https://petstore.swagger.io/v2
${Endpoint}       /pet/findByStatus
${Status}         available

*** Test Cases ***
Teste para listar todas as raças de pet
    Create Session    Petstore    ${BaseURL}
    ${headers}        Create Dictionary    Accept=application/json
    ${params}         Create Dictionary    status=${Status}
    ${response}      GET On Session     Petstore    ${Endpoint}    headers=${headers}    params=${params}
    Log To Console    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200    # Verificar se a resposta é bem-sucedida
    ${json_response}    Set Variable    ${response.json()}    # Converter a resposta JSON em um dicionário
   

*** Keywords ***

