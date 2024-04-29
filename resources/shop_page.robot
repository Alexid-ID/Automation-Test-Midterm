*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../resources/common.robot

*** Variables ***
# product 
${menu_bar}    //*[@id="root"]/div/div[2]/div[1]
${product_container}    //*[@id="root"]/div/div[2]/div[2]
${product_item}    //*[@id="root"]/div/div[2]/div[2]/div[1]/div
${product_item_name}    //*[@id="root"]/div/div[2]/div[2]/div[1]/div/div[2]/a/div


### SEARCH ### 
${seach_input}    //*[@id="root"]/div/div[2]/div[1]/form/input
${search_btn}    //*[@id="root"]/div/div[2]/div[1]/form/button

*** Keywords ***

### Access to Shop page ### 
Enter page shop from tab link and verify ui 
    Click Element    ${shop_tab_btn}
    Location Should Be    ${URL_SHOP}

    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${menu_bar}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

    # count item on page, should > 0 
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

Enter page shop from shop now button and verify ui
    Click Element    ${shop_now_btn}
    Location Should Be    ${URL_SHOP}
    
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${menu_bar}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

    # count item on page, should > 0 
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

Enter page shop directly
    Go To    ${URL_SHOP}
    
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${menu_bar}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

    # count item on page, should > 0 
    ${count_item}=    Get Element Count    locator=//*[contains(@class, "ui segment")]
    Should Be True    ${count_item} > 0

### Test search function ###
Seach product no keyword
    Page Should Contain Element    ${seach_input}
    Page Should Contain Element    ${search_btn}

    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

Search with no key word & press Enter 
    Page Should Contain Element    ${seach_input}
    Press Keys    ${seach_input}    \13
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}
    
Search with no key word & Click search btn
    Page Should Contain Element    ${seach_input}
    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

Search by product name 
    [Arguments]    ${name}
    Input Text    ${seach_input}    ${name}
    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}
    # count number of results

    Verify search result with keyword product name    ${name}


### Utility function ###
Verify search result with keyword product name 
    [Arguments]    ${name}
    
    # get product items 
    ${product_items}=    Get WebElements    ${product_item}
    Log To Console    ${product_items}

    # check each product_items name contain keyword
    FOR    ${item}    IN    @{product_items}
        ${item_name}=    Get Text    ${item}
        Should Contain    ${item_name}    ${name}
        Log To Console    ${item_name}
    END

Get number of product items 
    ${product_items}=    Get WebElements    ${product_item}
    ${count}=    Get Length    ${product_items}
    Log To Console    ${count}
    [Return]    ${count}