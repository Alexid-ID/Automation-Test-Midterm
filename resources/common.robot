*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${BROWSER}        Chrome
${URL_HOME}       https://dapper-pastelito-04ff24.netlify.app/
${URL_SHOP}       https://dapper-pastelito-04ff24.netlify.app/shop
${URL_CART}       https://dapper-pastelito-04ff24.netlify.app/cart

### HOME PAGE ### 
${shop_now_btn}    //*[@class="ui large button sc-crozmw hRWtOu"]
${shop_tab_btn}    //*[@id="root"]/div/div[1]/div/div/div[4]/ul/li[1]/a
${cart_tab_btn}    //*[@id="root"]/div/div[1]/div/div/div[4]/ul/li[2]/a

*** Keywords ***
Opening my browser 
    Open Browser    ${URL_HOME}    ${BROWSER}
    Location Should Be    ${URL_HOME}
    Maximize Browser Window

Closing my browser
    Close Browser

