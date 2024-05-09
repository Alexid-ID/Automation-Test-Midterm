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
${home_back}      //*[@id="root"]/div/div[1]/div/div/div[3]/a/span/img
${menu_bar}       //*[@id="root"]/div/div[2]/div[1]
${product_container}    //*[@id="root"]/div/div[2]/div[2]
${product_infor}    //*[@id="root"]/div/div[2]/div[1]/div[1]
${product_related}    //*[@id="root"]/div/div[2]/div[2]/div
${product_scroll}    xpath=/html/body/div/div/div[2]/div[2]/div[5]

*** Keywords ***
Access to product page
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Enter product page from shop page and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_head}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_price}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_head1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head1}
    ${value_head} =    Split String    ${value_head}    -
    ${value_head} =    Set Variable    ${value_head[0]}
    ${value_head} =    Strip String    ${value_head}
    ${value_price1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price1}
    Should Be Equal As Strings    ${value_price}    ${value_price1}
    Should Be Equal As Strings    ${value_head}    ${value_head1}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    Scroll Element Into View    ${product_related}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_related}
    # count item on page, should > 0
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

Enter another product page from shop and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead} =    Split String    ${valuehead}    -
    ${valuehead} =    Set Variable    ${valuehead[0]}
    ${valuehead} =    Strip String    ${valuehead}
    ${valueprice}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${valuehead1}
    ${valueprice1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${valueprice1}
    Should Be Equal As Strings    ${valueprice}    ${valueprice1}
    Should Be Equal As Strings    ${valuehead}    ${valuehead1}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_related}
    # count item on page, should > 0
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

Check page and verify product
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Verify right name price product
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead} =    Split String    ${valuehead}    -
    ${valuehead} =    Set Variable    ${valuehead[0]}
    ${valuehead} =    Strip String    ${valuehead}
    ${valueprice}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[3]/div/div[2]/a/div
    ${valuehead1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${valuehead1}
    ${valueprice1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${valueprice1}
    Should Be Equal As Strings    ${valueprice}    ${valueprice1}
    Should Be Equal As Strings    ${valuehead}    ${valuehead1}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_related}
    # count item on page, should > 0
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_head}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_price}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[2]/div/div[2]/a/div
    ${value_head1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head1}
    ${value_head} =    Split String    ${value_head}    -
    ${value_head} =    Set Variable    ${value_head[0]}
    ${value_head} =    Strip String    ${value_head}
    ${value_price1}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price1}
    Should Be Equal As Strings    ${value_price}    ${value_price1}
    Should Be Equal As Strings    ${value_head}    ${value_head1}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    Scroll Element Into View    ${product_related}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_related}
    # count item on page, should > 0
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head13}
    ${value_head3} =    Split String    ${value_head3}    -
    ${value_head3} =    Set Variable    ${value_head3[0]}
    ${value_head3} =    Strip String    ${value_head3}
    ${value_price13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price13}
    Should Be Equal As Strings    ${value_price3}    ${value_price13}
    Should Be Equal As Strings    ${value_head3}    ${value_head13}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

Test droplist and verify
    ${stock_element}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[4]
    ${number_string}=    Get Substring    ${stock_element}    17
    ${stock_number}=    Convert To Integer    ${number_string}
    Should Be Equal As Numbers    ${stock_number}    46
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}

Select products from list and add to cart and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head13}
    ${value_head3} =    Split String    ${value_head3}    -
    ${value_head3} =    Set Variable    ${value_head3[0]}
    ${value_head3} =    Strip String    ${value_head3}
    ${value_price13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price13}
    Should Be Equal As Strings    ${value_price3}    ${value_price13}
    Should Be Equal As Strings    ${value_head3}    ${value_head13}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    ${stock_element}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[4]
    ${number_string}=    Get Substring    ${stock_element}    17
    ${stock_number}=    Convert To Integer    ${number_string}
    Should Be Equal As Numbers    ${stock_number}    46
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}
    Execute Javascript    window.scrollTo(0, window.scrollY + 300)
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/div[5]/span
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/div[5]
    ${getvalue_validate}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    ${getvalue_validate}
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    ${element_text}
    ${element_textexpect}=    Get Text    xpath=/html/body/div/div/div[2]/div/div[1]/table/tbody/tr/td[3]/a/h2
    Should Be Equal As Strings    ${value_head13}    ${element_textexpect}

Select all products from list and add to cart and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head13}
    ${value_head3} =    Split String    ${value_head3}    -
    ${value_head3} =    Set Variable    ${value_head3[0]}
    ${value_head3} =    Strip String    ${value_head3}
    ${value_price13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price13}
    Should Be Equal As Strings    ${value_price3}    ${value_price13}
    Should Be Equal As Strings    ${value_head3}    ${value_head13}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    ${stock_element}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[4]
    ${number_string}=    Get Substring    ${stock_element}    17
    ${stock_number}=    Convert To Integer    ${number_string}
    Should Be Equal As Numbers    ${stock_number}    46
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}
    Execute Javascript    window.scrollTo(0, window.scrollY + 300)
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Execute JavaScript    document.evaluate('//span[text()="46"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    ${getvalue_validate}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    ${getvalue_validate}
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    ${element_text}
    ${element_textexpect}=    Get Text    xpath=/html/body/div/div/div[2]/div/div[1]/table/tbody/tr/td[3]/a/h2
    Should Be Equal As Strings    ${value_head13}    ${element_textexpect}

Select number products and all product from list add to cart and verify
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head13}
    ${value_head3} =    Split String    ${value_head3}    -
    ${value_head3} =    Set Variable    ${value_head3[0]}
    ${value_head3} =    Strip String    ${value_head3}
    ${value_price13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price13}
    Should Be Equal As Strings    ${value_price3}    ${value_price13}
    Should Be Equal As Strings    ${value_head3}    ${value_head13}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    ${stock_element}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[4]
    ${number_string}=    Get Substring    ${stock_element}    17
    ${stock_number}=    Convert To Integer    ${number_string}
    Should Be Equal As Numbers    ${stock_number}    46
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}
    Execute Javascript    window.scrollTo(0, window.scrollY + 300)
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/div[5]/span
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/div[5]
    ${getvalue_validate}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    ${getvalue_validate}
    ${value1}=    Set Variable    ${element_count}
    ${value2}=    Set Variable    ${element_text}
    ${available}=    Evaluate    ${value1} - ${value2}
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${element2}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count2}=    Get Length    ${element2}
    Should Be Equal As Strings    ${element_count2}    ${available}
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Execute JavaScript    document.evaluate('//span[text()=${element_count2}]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    ${getvalue_validate}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button[1]
    Wait Until Element Is Enabled    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button[2]
    Sleep    2
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    ${element_count}
    ${element_textexpect}=    Get Text    xpath=/html/body/div/div/div[2]/div/div[1]/table/tbody/tr/td[3]/a/h2
    Should Be Equal As Strings    ${value_head13}    ${element_textexpect}

Remove added items from cart
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/h1
    Page Should Contain    ${value_head13}
    ${value_head3} =    Split String    ${value_head3}    -
    ${value_head3} =    Set Variable    ${value_head3[0]}
    ${value_head3} =    Strip String    ${value_head3}
    ${value_price13}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/span
    Page Should Contain    ${value_price13}
    Should Be Equal As Strings    ${value_price3}    ${value_price13}
    Should Be Equal As Strings    ${value_head3}    ${value_head13}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_infor}
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0
    ${stock_element}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[4]
    ${number_string}=    Get Substring    ${stock_element}    17
    ${stock_number}=    Convert To Integer    ${number_string}
    Should Be Equal As Numbers    ${stock_number}    46
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}
    Execute Javascript    window.scrollTo(0, window.scrollY + 300)
    Wait Until Page Contains Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Execute JavaScript    document.evaluate('//span[text()="46"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    ${getvalue_validate}=    Get Text    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    ${element_text}=    Get Text    xpath=/html/body/div[1]/div/div[1]/div/div/div[4]/ul/li[2]/a/div
    Should Be Equal As Strings    ${element_text}    ${getvalue_validate}
    Click Element    ${cart_tab_btn}
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/div[1]/table
    ${quantity_value}=    Get Text    xpath=//*[@id="root"]/div/div[2]/div/div[1]/table/tbody/tr/td[4]/div/div/span
    Should Be Equal As Strings    ${quantity_value}    ${element_text}
    ${element_textexpect}=    Get Text    xpath=/html/body/div/div/div[2]/div/div[1]/table/tbody/tr/td[3]/a/h2
    Should Be Equal As Strings    ${value_head13}    ${element_textexpect}
    Click Element    xpath=/html/body/div/div/div[2]/div/div[1]/table/tbody/tr/td[3]/a/h2
    Execute Javascript    window.scrollTo(0, window.scrollY + 300)
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[6]/button[2]
    Click Element    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/i
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]
    ${elements}=    Get WebElements    xpath=/html/body/div/div/div[2]/div[1]/div[1]/div[2]/div/div[5]/span/div/div[2]/*
    ${element_count}=    Get Length    ${elements}
    Should Be Equal As Strings    ${element_count}    ${stock_number}

Test related products
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Test Columns Existence
    Click Element    ${button_shop}
    Location Should Be    ${URL_SHOP}
    Wait Until Page Contains Element    ${menu_bar}
    Wait Until Page Contains Element    ${product_container}
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_head3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    ${value_price3}=    Get Text    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/span/p[1]
    Click Element    xpath=/html/body/div/div/div[2]/div[2]/div[4]/div/div[2]/a/div
    Execute Javascript    window.scrollTo(0, window.scrollY + 500)
    ${columns} =    Get WebElements    xpath://div[@class="column"]
    Should Be True    ${columns}    Columns Exist

Test Images Src
    ${images} =    Get WebElements    xpath://div[@class="column"]//img
    FOR    ${image}    IN    @{images}
        ${src} =    Get Element Attribute    ${image}    src
        Should Contain    ${src}    https://cdn.dummyjson.com/product-images/
    END

Test Product Titles
    ${titles} =    Get WebElements    xpath://div[@class="column"]//div[@class="ui header rp-title"]
    FOR    ${title}    IN    @{titles}
        ${text} =    Get Text    ${title}
        Run Keyword If    '${text}' != ''    Should Not Be Empty    ${text}
    END
