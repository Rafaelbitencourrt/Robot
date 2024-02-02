*** Settings ***
Documentation    Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS

*** Variables ***
#TIPO SIMPLES
${SIMPLES}    Vamos ver os tipos de variáveis no robot!

#TIPO LISTA
@{FRUTAS}    morango    abacaxi    banana

#TIPO DICIONÁRIO
&{PESSOA}    nome=Rafael    email=rafaelbitencourt@exemplo.com    idade=32

*** Test Cases ***

Caso de teste de exemplo 1
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    #SIMPLES
    Log    ${SIMPLES}

    #LISTA
    Log    Essa tem que ser banana: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]} 

    #DICIONARIO
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}