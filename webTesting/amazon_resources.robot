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
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICO}
    

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

adicionar o produto "${NOME_PRODUTO}" no carrinho
    Click Element    //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${NOME_PRODUTO}')]
    Wait Until Element Is Visible    productTitle

# Verificar se o produto "${Produto}" foi adicionado com sucesso
#     Wait Until Element Is Visible    locator//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
    

# Remover o produto "${Produto}" do carrinho
#    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
#    Wait Until Page Contains    text=Carrinho de compras
#    Click Element    locator=submit.delete.72f49694-a2fa-439d-9f53-b9e12ec3ec8c

# Verificar se o carrinho fica vazio
#    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio
#####GHERKIN STEPS######

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"