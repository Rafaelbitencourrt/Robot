*** Settings ***
Documentation    Exemplo de uso de variaveis como argumentos em keywords 

*** Variables ***

&{PESSOA}    nome=Rafael    email=rafael@teste.com    idade=12    sexo=masculino

*** Test Cases ***
Caso de teste de exemplo
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos    ${PESSOA.nome}    ${PESSOA.email}
    ${MENSAGEM_ALERTA}    Uma subkeyword com retorno    ${PESSOA.nome}    ${PESSOA.idade}
    Log    ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]    ${NOME_USUARIO}    ${EMAIL_USUARIO}
    Log    Nome Usuario: ${NOME_USUARIO}
    Log    Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]    ${NOME_USUARIO}    ${IDADE_USUARIO}
    ${MENSAGEM}    Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! Usuario ${NOME_USUARIO} é menor de idade!    Ok o usuario é maior de idade!
    [Return]    ${MENSAGEM}