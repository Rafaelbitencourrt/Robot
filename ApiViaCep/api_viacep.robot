*** Settings ***
Resource    api_viacep_resources.robot

*** Test Cases ***

Cenario 01 - Consultar CEP
    Conectar ao WebService da ViaCep
    Consultar CEP "92310150"
    Validar status code "200"
    Validar logradouro "Rua Brasil"