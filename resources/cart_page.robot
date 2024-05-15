*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../resources/common.robot

*** Variables ***
${URL_CART}       https://dapper-pastelito-04ff24.netlify.app/cart
${URL_SHOP}       https://dapper-pastelito-04ff24.netlify.app/shop
${button_cart}    //*[@id="root"]/div/div[1]/div/div/div[4]/ul/li[2]
${button_shop}    //*[@id="root"]/div/div[1]/div/div/div[4]/ul/li[1]
${alink_shop}     //*[@id="root"]/div/div[2]/div/a
${home_back}      //*[@id="root"]/div/div[1]/div/div/div[3]/a/span/img
${cart_icon}      //*[@id="root"]/div/div[2]/div/img
${menu_bar}       //*[@id="root"]/div/div[2]/div[1]
${product_container}    //*[@id="root"]/div/div[2]/div[2]

*** Keywords ***
Access Cart Page And Verify
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Enter cart page directly and verify UI
    Go To    ${URL_CART}
    Location Should Be    ${URL_CART}
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Enter cart page from tab link and verify UI
    Click Element    ${button_cart}
    Location Should Be    ${URL_CART}
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Comeback Shop Page From Cart Page
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Enter page shop from tab link and verify UI
    Click Element    ${cart_tab_btn}
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}

Enter page shop from a link and verify UI
    Click Element    ${cart_tab_btn}
    Click Element    ${alink_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}

Add Product To Cart And Verify
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Add product from a link from cart page and verify
    Click Element    ${cart_tab_btn}
    Click Element    ${alink_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout

Add product from tab link shop from cart page and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    Click Element    ${button_shop}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    2

Remove Product From Cart And Verify
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Remove product and verify products by minus sign
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
    Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Remove product and verify products by remove link
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/button
    Click Element    xpath=/html/body/div[1]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/button
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Remove product and verify products by remove all link
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Update Quantity of Products in Cart
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Add product many times and verify products by comeback shop
    FOR    ${index}    IN RANGE    1    10
        Click Element    ${button_shop}
        Location Should Be    ${URL_SHOP}
        Wait Until Page Contains Element    ${menu_bar}
        Wait Until Page Contains Element    ${product_container}
        Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        ${element_text} =    Execute JavaScript    return document.evaluate('/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.textContent
        ${element_text} =    Replace String    ${element_text}    \s*$    ${EMPTY}
        ${element_text} =    Replace String    ${element_text}    ^\s*    ${EMPTY}
        Should Be Equal As Strings    ${element_text}    ${index}
        Click Element    ${cart_tab_btn}
        Wait Until Page Contains Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${index}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
        ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
        Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    END

Add product many times and verify products by increasing quantity
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    FOR    ${index}    IN RANGE    1    10
        Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[2]
        Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${index+1}
    END

Remove product many time and verify products by all remove link
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    FOR    ${index}    IN RANGE    1    10
        Click Element    ${button_shop}
        Location Should Be    ${URL_SHOP}
        Wait Until Page Contains Element    ${menu_bar}
        Wait Until Page Contains Element    ${product_container}
        Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        ${element_text} =    Execute JavaScript    return document.evaluate('/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.textContent
        ${element_text} =    Replace String    ${element_text}    \s*$    ${EMPTY}
        ${element_text} =    Replace String    ${element_text}    ^\s*    ${EMPTY}
        Should Be Equal As Strings    ${element_text}    ${index}
        Click Element    ${cart_tab_btn}
        Wait Until Page Contains Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${index}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
        ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
        Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    END
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Remove product many time and verify products by minus
    FOR    ${index}    IN RANGE    1    10
        Click Element    ${button_shop}
        Location Should Be    ${URL_SHOP}
        Wait Until Page Contains Element    ${menu_bar}
        Wait Until Page Contains Element    ${product_container}
        Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        ${element_text} =    Execute JavaScript    return document.evaluate('/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.textContent
        ${element_text} =    Replace String    ${element_text}    \s*$    ${EMPTY}
        ${element_text} =    Replace String    ${element_text}    ^\s*    ${EMPTY}
        Should Be Equal As Strings    ${element_text}    ${index}
        Click Element    ${cart_tab_btn}
        Wait Until Page Contains Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${index}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
        ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
        Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    END
    FOR    ${index}    IN RANGE    1    5
        ${quantity_expected}=    Set Variable    ${${9} - ${index}}
        Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
        Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        Should Be Equal As Strings    ${element_text}    ${quantity_expected}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${quantity_expected}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
        ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
        Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    END

Remove product many time and verify products empty
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tfoot/tr/th[1]/button
    FOR    ${index}    IN RANGE    1    10
        Click Element    ${button_shop}
        Location Should Be    ${URL_SHOP}
        Wait Until Page Contains Element    ${menu_bar}
        Wait Until Page Contains Element    ${product_container}
        Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
        ${element_text} =    Execute JavaScript    return document.evaluate('/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.textContent
        ${element_text} =    Replace String    ${element_text}    \s*$    ${EMPTY}
        ${element_text} =    Replace String    ${element_text}    ^\s*    ${EMPTY}
        Should Be Equal As Strings    ${element_text}    ${index}
        Click Element    ${cart_tab_btn}
        Wait Until Page Contains Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
        Should Be Equal As Strings    ${quantity_value}    ${index}
        Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
        ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
        Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    END
    FOR    ${index}    IN RANGE    1    10
        ${quantity_expected}=    Set Variable    ${${9} - ${index}}
        Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
        Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/button[1]
    END
    Wait Until Page Contains Element    ${cart_icon}
    Page Should Contain Element    ${cart_icon}
    Page Should Contain    Your cart is empty

Verify Total Price Calculation in Cart
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Verify Total Price Calculation in Cart 1 product
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    ${price1}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[5]
    ${totalprice}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/dl[2]/dd/strong
    Should Be Equal As Strings    ${price1}    ${totalprice}

Verify Total Price Calculation in Cart 2 products
    Click Element    ${button_shop}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    2
    Click Element    ${cart_tab_btn}
    ${price1}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[5]
    ${totalprice}=    Get Text    xpath=/html/body/div/div/div[2]/div/div[4]/div/dl[2]/dd/strong
    ${price2}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[5]
    ${value1} =    Replace String    ${price1}    \$    ${EMPTY}
    ${value2} =    Replace String    ${price2}    \$    ${EMPTY}
    ${totalprice} =    Replace String    ${totalprice}    \$    ${EMPTY}
    ${value1}=    Set Variable    ${value1}
    ${value2}=    Set Variable    ${value2}
    ${myresult}=    Evaluate    ${value1} + ${value2}
    Should Be Equal As Strings    ${myresult}    ${totalprice}

Check All Problem
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${button_shop}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    2
    Click Element    ${button_shop}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    3
    Click Element    ${cart_tab_btn}
    Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody[1]/tr/td[4]/div/div/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    4
    Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[4]/div/div/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    5
    Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[4]/div/div/button[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    6
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[4]/div/div/button[1]
    Click Element    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[4]/div/div/button[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    5
    ${totalprice}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/dl[2]/dd/strong
    ${price1}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody[1]/tr/td[5]
    ${price2}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody[2]/tr/td[5]
    ${price3}=    Get Text    //*[@id="root"]/div/div[2]/div/div[1]/table/tbody[3]/tr/td[5]
    ${value1} =    Replace String    ${price1}    \$    ${EMPTY}
    ${value2} =    Replace String    ${price2}    \$    ${EMPTY}
    ${value3} =    Replace String    ${price3}    \$    ${EMPTY}
    ${totalprice} =    Replace String    ${totalprice}    \$    ${EMPTY}
    ${value1}=    Set Variable    ${value1}
    ${value2}=    Set Variable    ${value2}
    ${value3}=    Set Variable    ${value3}
    ${myresult}=    Evaluate    ${value1} + ${value2} + ${value3}
    Should Be Equal As Strings    ${myresult}    ${totalprice}

Check Out
    Click Element    ${cart_tab_btn}
    Click Element    ${alink_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    1
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    1
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    ${checkout_value}=    Get Text    //*[@id="root"]/div/div[2]/div/div[4]/div/button
    Should Be Equal As Strings    ${checkout_value}    Continue to checkout
    Click Element    //*[@id="root"]/div/div[2]/div/div[4]/div
    Page Should Not Contain Element    //*[@id="root"]/div/div[2]/div/div[4]/div
