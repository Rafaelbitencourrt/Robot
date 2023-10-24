*** Settings ***
Resource    testApiFakerResources.robot

Suite Setup    Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros
    Requisitar todos os livros
    Conferir status code     200
    Conferir se retornar uma lista com "200" livros

Buscar livro por id
    Requisitar o livro "32"
    Conferir status code     200
    Conferir se retorna todos os dados corretos do livro 32

Criar um livro
    Criar um livro
    Conferir status code    200
    Conferir se retorna todos os dados corretos do livro cadastrado
