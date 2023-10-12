*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/ 
${MENU_ELETRONICOS}    //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${PESQUISA}    nav-search-submit-button
${RESULTADO}        //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}  
   
Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${TEXTO_HEADER_ELETRONICO}"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICO}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA_NOME}"
    Sleep    2s
    Scroll Element Into View    locator=//a[@aria-label='${CATEGORIA_NOME}']
    Element Should Be Visible    locator=//a[@aria-label='${CATEGORIA_NOME}']
    
Digitar o nome do produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    twotabsearchtextbox    ${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${PESQUISA}

Verificar o resultado de pesquisa, listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${NOME_PRODUTO}')]