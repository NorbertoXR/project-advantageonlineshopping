

*** Settings ***
Resource    ../resources/Pages/Main.resource



Test Setup    carregar site advantagesOnlineShopping    https://advantageonlineshopping.com/#/    gc
Test Teardown    fechar browser
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py

*** Variables ***
${username}    admin
${password}    adm1n


*** Test Cases ***
CT1 - Logout do site advantageonlineshopping.com
    [Documentation]    Cenário de teste que valida a funcionalidade de sign out.
    [Tags]    desafio-INM    Logout
    Given estou logado    ${username}    ${password}
    When click em Logout
    Then sou desconectado do site