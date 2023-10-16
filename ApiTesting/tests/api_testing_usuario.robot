*** Settings ***
Resource    ../resources/api_testing__usuarios.resource

*** Variables ***

*** Test Cases ***

Cenario 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um novo usuário
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se usuário foi cadastradado corretamente

Cenario 02: Cadastrar um usuário existente
    Criar um novo usuário
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}        status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro duplicado

Cenário 03: Consultar os dados de um novo usuário
    Criar um novo usuário
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}        status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados