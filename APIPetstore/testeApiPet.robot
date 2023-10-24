*** Settings ***
Resource    testeApiPetResources.robot

Suite Setup    Conectar a minha API

*** Test Cases ***

Cenario 01: Api online
    Conectar a minha API
    Criar um novo usuário
    Cadastrar o usuário criado na PetStore    ${EMAIL_TESTE}    status_code_desejado=200