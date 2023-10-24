*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}        http://fakerestapi.azurewebsites.net/api/v1

*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}    Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

Requisitar todos os livros
    ${response}    GET On Session    fakeAPI    Books
    Log    ${response}
    Set Test Variable    ${response}
   
Conferir status code
    [Arguments]    ${STATUS_CODE}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_CODE}
   
Conferir se retornar uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${response.json()}    ${QTDE_LIVROS}