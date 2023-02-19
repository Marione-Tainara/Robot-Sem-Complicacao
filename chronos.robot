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
${inputName}        name
${inputCounty}      country
${inputCity}        city
${inputCard}        card
${inputMonth}       month
${inputYear}        year
${btnPurchase}      //button[text()='Purchase']
${confirmBtn}       .confirm
${textThanks}       .sweet-alert>h2


*** Test Cases ***
chronos Test
    Add item to cart
    Stop purchase


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

Stop purchase
    Click Link    ${optionCart}
    Click Button    css=${placeOder}
    Wait Until Element Is Visible    id=${inputName}
    Input Text    id=${inputName}    Jane Doe
    Input Text    id=${inputCounty}    Brasil
    Input Text    id=${inputCity}    Porto Alegre
    Input Text    id=${inputCard}    12345678910
    Input Text    id=${inputMonth}    06
    Input Text    id=${inputYear}    2025
    Click Button    xpath=${btnPurchase}
    Element Text Should Be    css=${textThanks}    Thank you for your purchase!
    Click Button    css=${confirmBtn}
