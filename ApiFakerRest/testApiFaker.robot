*** Settings ***
Resource    testApiFakerResources.robot

Suite Setup    Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros
    Requisitar todos os livros
    Conferir status code     200
    Conferir se retornar uma lista com "200" livros