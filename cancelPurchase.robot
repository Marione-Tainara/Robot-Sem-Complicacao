*** Settings ***
Documentation       Robot Framework Sem Complicação

Library             SeleniumLibrary    timeout=500
Library             Process

*** Variables ***
${url}              https://www.demoblaze.com
${navegador}        chrome
${MacBookPro}       MacBook Pro
${btnAddCart}       //div[2]//a
${selectLaptop}     Laptops
${optionCart}       Cart
${placeOder}        .btn-success



*** Test Cases ***
chronos Test
    Add item to cart



*** Keywords ***
Add item to cart
    Open Browser    ${url}    ${navegador}
    Maximize Browser Window
    Click Link    ${selectLaptop}
    Wait Until Element Is Visible    link=${MacBookPro}
    Click Link    ${MacBookPro}
    Wait Until Element Is Visible    xpath=${btnAddCart}
    Click Element    xpath=${btnAddCart}
    Alert Should Be Present
    Click Link    ${optionCart}
    Wait Until Element Is Visible    css=#tbodyid > tr > td:nth-child(4) > a
    Click Link    Delete
