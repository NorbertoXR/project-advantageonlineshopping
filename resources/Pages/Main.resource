

*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    HomePage.resource
Resource    Login.resource
Resource    ProductDetails.resource
Resource    ShoppingCart.resource
Resource    OrderPAyment.resource

*** Variables ***
${env}    ${CURDIR}/../data/advantagesonlineshopping.json
#${siteURL}    Get Value From Json    ${env}    $url
*** Keywords ***
carregar arquivo ambiente
    [Arguments]    ${PATH}
    ${json}    Load Json From File    ${PATH}
    RETURN   ${json} 

carregar site advantagesOnlineShopping
    #[Arguments]    ${URL}    ${BROWSER}

    ${json}    carregar arquivo ambiente    ${env}
    ${url}    Get Value From Json    json_object=${json}    json_path=$.url
    ${browser}    Get Value From Json    json_object=${json}    json_path=$.browser
    Open Browser    ${url}[0]    ${browser}[0]
    Maximize Browser Window

carregar site advantagesOnlineShopping e logar
    [Arguments]    ${URL}    ${BROWSER}    ${USERNAME}    ${$PASSWORD}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    estou logado    ${USERNAME}    ${$PASSWORD}

fechar browser
    Close Browser

fechar site advantagesOnlineShopping
    click em Logout
    sou desconectado do site
    Close Browser
