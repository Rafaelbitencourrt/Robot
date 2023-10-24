*** Settings ***
Library    RequestsLibrary

*** Variables ***
${HOST_VIACEP}        http://viacep.com.br

*** Keywords ***

Conectar ao WebService da ViaCep
    Create Session    ViaCep    ${HOST_VIACEP}

Consultar CEP "${CEP}"
    ${response}=    GET On Session    ViaCEP    /ws/${CEP}/json
    Set Suite Variable    ${response}
    Log To Console    Resposta: ${response.text}

Validar status code "${status_code}"
    Should Be Equal As Integers    ${status_code}    ${response.status_code}

Validar logradouro "${logradouro}"
    Should Be Equal As Strings    ${logradouro}    ${response.json()}[logradouro]