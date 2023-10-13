*** Settings ***
Resource    ../resources/api_testing__usuarios.resource

*** Variables ***

*** Test Cases ***

Cenario 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um novo usuário
    # Cadastrar o usuário criado na ServeRest
    # Conferir se usuário foi cadastradado corretamente