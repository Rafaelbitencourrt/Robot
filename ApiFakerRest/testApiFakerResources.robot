*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}        http://fakerestapi.azurewebsites.net/api/v1

&{BOOK_32}    id=${32}     
...           title=Book 32      
...           pageCount=${3200}

&{NEW_BOOK}    id=${29081991}
...            title=Vida de um QA
...            description=Book teste
...            pageCount=${260}
...            excerpt=Teste
...            publishDate=2023-10-24T10:00:00.210Z



*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}    Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

Requisitar todos os livros
    ${response}    GET On Session    fakeAPI    Books
    Log    ${response}
    Set Test Variable    ${response}

Requisitar o livro "${id}"
    ${response}    GET On Session    fakeAPI    Books/${id}
    Log    ${response}
    Set Test Variable    ${response}

Criar um livro
    ${response}    POST On Session    fakeAPI    Books    json=${NEW_BOOK}    headers=${HEADERS}
    Log    ${response.text}
    Set Test Variable    ${response}
   
Conferir status code
    [Arguments]    ${STATUS_CODE}
    Should Be Equal As Strings    ${response.status_code}    ${STATUS_CODE}
   
Conferir se retornar uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${response.json()}    ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 32
    Dictionary Should Contain Item    ${response.json()}    id    ${BOOK_32.id}
    Dictionary Should Contain Item    ${response.json()}    title    ${BOOK_32.title}
    Dictionary Should Contain Item    ${response.json()}    pageCount    ${BOOK_32.pageCount}
    Should Not Be Empty    ${response.json()["description"]}
    Should Not Be Empty    ${response.json()["excerpt"]}
    Should Not Be Empty    ${response.json()["publishDate"]}

Conferir se retorna todos os dados corretos do livro cadastrado
    Dictionary Should Contain Item    ${response.json()}            id             ${NEW_BOOK.id}
    Dictionary Should Contain Item    ${response.json()}            title          ${NEW_BOOK.title}
    Dictionary Should Contain Item    ${response.json()}            pageCount      ${NEW_BOOK.pageCount}
    Dictionary Should Contain Item    ${response.json()}            description    ${NEW_BOOK.description}
    Dictionary Should Contain Item    ${response.json()}            excerpt        ${NEW_BOOK.excerpt}
    Should Not Be Empty               ${response.json()["publishDate"]}        