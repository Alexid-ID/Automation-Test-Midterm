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
${product_container}    //div[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']

${empty_product_container}    //div[@class='ui container']/div[contains(@class, 'loader')]

# product card 
${product_item}    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div[@class='ui segment sc-gWHAAX eUdgQa']

${product_item_title}    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div/div/a/div[@class='ui header sc-ejWHKt jFBJAy']

${product_item_price}    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div/div/span/p[@class='sc-eWhHU imPcf']

${product_item_rating}    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div[@class='ui segment sc-gWHAAX eUdgQa']/div[@class='ui segment sc-gWHAAX sc-ccVCaX eUdgQa kPxwND']/a/span

${product_item_discount}    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div/div/h3[@class='product-card__discount']

### search ### 
${seach_input}    //*[@id="root"]/div/div[2]/div[1]/form/input
${search_btn}    //*[@id="root"]/div/div[2]/div[1]/form/button

### category ###
${category_btn}    //div[@class="ui dropdown"]
${reset_filter_btn}    //*[@class="reset-filter"]
${category_menu}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[1]/div[@class='ui active visible dropdown']/div[contains(@class, 'menu transition')]

### price range ###
${price_range_btn}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/div[@class='ui dropdown']

${price_range_menu}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/div[@class='ui active visible dropdown']/div[contains(@class, 'menu transition')]

${min_limit}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/form[@class='sc-dzbdsH djCGYQ']/input[1]

${max_limit}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/form[@class='sc-dzbdsH djCGYQ']/input[2]

# order by
${order_by_btn}    //div[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui dropdown'][1]

${order_by_menu}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown']/div[contains(@class, 'menu transition')]

# sort
${sort_btn}    //div[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui dropdown'][2]

${sort_menu}    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown'][1]/div[contains(@class, 'menu transition')]

### product detail ###
${product_detail_name}    //*[@class="product-title"]
${product_detail_category}    //*[@class="sc-emqRaN glbxJe"][1]/h4
# ${product_detail_discount}    //*[@class="product-card__discount"]
# ${product_detail_img}    //*[@class="sc-jnqLxu hMUwTt"]
# ${product_detail_price}    //*[@class="sc-eWhHU imPcf"]
# ${product_detail_cart_btn}    //button[@class="ui large button"]
${product_detail_brand}    //*[@class="sc-emqRaN glbxJe"][1]/h4

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

Search with no key word & Press Enter 
    Page Should Contain Element    ${seach_input}
    Press Keys    ${seach_input}    \13
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}
    
Search with no key word & Click search btn
    Page Should Contain Element    ${seach_input}
    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_container}

Search product 
    [Arguments]    ${name}
    Input Text    ${seach_input}    ${name}
    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    ${product_item}
    Sleep    2s

Search with keyword not exist
    [Arguments]    ${name}
    Input Text    ${seach_input}    ${name}
    Click Element    ${search_btn}
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    ${empty_product_container}
    ${count_item}=    Get Element Count    ${product_item}
    Should Be True    ${count_item} == 0

Verify card product
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_item}
    # get the first product name
    # ${the_first_product}=    Get WebElement    ${product_item}
    ${second_product_card}=    Get WebElement    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div[2]/div/div/a/div[@class='ui header sc-ejWHKt jFBJAy']
    ${title_text}=    Get Text    ${second_product_card}
    # Log To Console    message: ${title_text}
    
### Test category filter ###
Filter by category
    [Arguments]    ${category}    ${order}
    ${category}=    Convert To Lower Case    ${category}

    # click on category & check if menu visible 
    Click Element    ${category_btn}
    # Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    //*[contains(@class, 'visible menu transition')]
    Wait Until Keyword Succeeds    10s    1s    Element Should Be Visible    ${category_menu}

    IF    ${order} == 0
        ${option}=    Get WebElement    //div[contains(@class, 'menu transition')][1]//div//span
    ELSE
        ${option}=    Get WebElement    //div[contains(@class, 'menu transition')][1]/div[@class='item'][${order}]/span
    END

    # recheck option 
    ${element_text}=    Get Text    ${option}
    ${element_text}=    Convert To Lower Case    ${element_text}
    Should Contain    ${element_text}    ${category}

    # choose option 
    Click Element    ${option}
    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    //*[contains(@class, 'menu transition')]
    Sleep    2s

### Test price range filter ###
Filter by price range 
    [Arguments]    ${order}
    ${min}=    Set Variable    ${EMPTY}
    ${max}=    Set Variable    ${EMPTY}

    IF    ${order} == 0
        ${max}=    Set Variable    50
    ELSE IF    ${order} == 1
        ${min}=    Set Variable    50
        ${max}=    Set Variable    200
    ELSE IF    ${order} == 2
        ${min}=    Set Variable    200
        ${max}=    Set Variable    500
    ELSE IF    ${order} == 3
        ${min}=    Set Variable    500
        ${max}=    Set Variable    1000
    ELSE IF    ${order} == 4
        ${min}=    Set Variable    1000
    END 

    # select price range btn
    Page Should Contain Element    ${price_range_btn}
    Click Element    ${price_range_btn}
    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${price_range_menu}

    # select option
    IF    ${order} == 0
        ${option}=    Get WebElement    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/div[@class='ui active visible dropdown']/div[@class='visible menu transition']/div[contains(@class, 'item')]
    ELSE
        ${option}=    Get WebElement    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='sc-kJpdyg hqqrVo']/div[@class='ui active visible dropdown']/div[@class='visible menu transition']/div[@class='item'][${order}]
    END

    ${text}=    Get Text    ${option}
    # Log To Console    text: ${text}
    Click Element    ${option}

    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${price_range_menu}
    Sleep    2s

### Test order by filter ###
Filter order by 
    [Arguments]    ${type}
    # select order by btn
    Page Should Contain Element    ${order_by_btn}
    Click Element    ${order_by_btn}
    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${order_by_menu}

    # select option
    IF    $type == 'price'
        ${idx}=    Set Variable    0
    ELSE IF    $type == 'discount rate'
        ${idx}=    Set Variable    1
    ELSE IF    $type == 'item title'
        ${idx}=    Set Variable    2
    ELSE IF    $type == 'rating'
        ${idx}=    Set Variable    3
    ELSE
        Fail    Not support type        
    END
    
    IF    $type == 'price'
        ${option}=    Get WebElement    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown']/div[@class='visible menu transition']/div[contains(@class, 'item')]
    ELSE
        ${option}=    Get WebElement    //*[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown']/div[contains(@class, 'menu transition')]/div[@class='item'][${idx}]
    END

    # Log To Console    idx: ${idx}

    ${text}=    Get Text    ${option}
    # Log To Console    text: ${text}

    Click Element    ${option}
    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${order_by_menu}
    Sleep    2s
    # check selected option
    ${text}=    Convert To Lower Case    ${text}
    ${type}=    Convert To Lower Case    ${type}
    Should Contain    ${text}    ${type}

    # check btn text 
    ${btn_text}=    Get Text    ${order_by_btn}
    ${btn_text}=    Convert To Lower Case    ${btn_text}
    Should Contain    ${btn_text}    ${type}
    
### Sort product list ###    
Sort product list 
    [Arguments]    ${order}
    ${order}=    Convert To Lower Case    ${order}
    
    # select sort btn
    Page Should Contain Element    ${sort_btn}
    Click Element    ${sort_btn}
    Wait Until Keyword Succeeds    10s    2s    Element Should Be Visible    ${sort_menu}

    # select option
    IF    $order == 'asc'
        # Log To Console    order - asc: ${order}
        ${option}=    Get WebElement    //div[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown']/div[@class='visible menu transition']/div[contains(@class, 'item')][1]
        Click Element    ${option}

    ELSE IF    $order == 'desc'
        # Log To Console    order - desc: ${order}
        ${option}=    Get WebElement    //div[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui active visible dropdown']/div[@class='visible menu transition']/div[contains(@class, 'item')][2]
        Click Element    ${option}

    ELSE
        Fail    Not support order
    END

    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${sort_menu}
    Sleep    2s

    ${btn_text}=    Get Text    //div[@class='ui container']/div[@class='ui sc-iCnXOK fznQvv menu']/div[@class='ui dropdown'][2]/div[@class='divider text']
    # Log To Console    text: ${btn_text}
    ${btn_text}=    Convert To Lower Case    ${btn_text}
    Should Contain    ${btn_text}    ${order}

### Reset filter ###
Reset filter and verify
    Page Should Contain Element    ${reset_filter_btn}
    Click Element    ${reset_filter_btn}

    Wait Until Keyword Succeeds    10s    2s    Element Should Not Be Visible    ${reset_filter_btn}
    Sleep    2s

    # product len = 70
    ${product_items_len}=    Get Element Count    ${product_item}
    Should Be True    ${product_items_len} == 70

    # check search input empty 
    ${value}=    Get Value    ${seach_input}
    Should Be Equal    ${value}    ${EMPTY}

    # check category, text equal: Category: 
    ${cate_text}=    Get Text    //div[@class="ui dropdown"]/div[@class="divider text"]
    ${cate_text}=    Convert To Lower Case    ${cate_text}
    Should Be Equal As Strings    ${cate_text}    category:

    # check price range, text equal: Price range:
    # input min & max empty
    ${min_value}=    Get Value    locator=${min_limit}
    ${max_value}=    Get Value    locator=${max_limit}
    # Log To Console    min_value: ${min_value}, max_value: ${max_value}
    Should Be Equal    ${min_value}    ${EMPTY}
    Should Be Equal    ${max_value}    ${EMPTY}

    # check order by, text equal: Order by:
    ${btn_text}=    Get Text    ${order_by_btn}
    ${btn_text}=    Convert To Lower Case    ${btn_text}
    Should Be Equal As Strings    ${btn_text}    order by:

### Utility function ###
Verify search result with keyword product name 
    [Arguments]    ${name}
    # get product names 
    ${product_item_names}=    Get WebElements    ${product_item_title}
    
    ${len}=    Get Length    ${product_item_names}
    # Log To Console    len: ${len}

    FOR    ${element}    IN    @{product_item_names}
        ${text}=    Get Text    ${element}
        # lower case for compare
        ${text}=    Convert To Lower Case    ${text}
        ${name}=    Convert To Lower Case    ${name}
        Should Contain    ${text}    ${name}
    END

Verify search result with keyword product details
    [Arguments]    ${type}    ${keyword}
    ${keyword}=    Convert To Lower Case    ${keyword}

    # check product items category 
    ${product_items}=    Get WebElements    ${product_item}
    ${len_product_items}=    Get Length    ${product_items}
    # Log To Console    len: ${len_product_items}
    
    FOR    ${i}    IN RANGE    0    ${len_product_items}
        ${idx}=    Evaluate    ${i} + 1
        ${idx}=    Convert To String    ${idx}
        # Log To Console    idx: ${idx}

        ${xpath}=    Set Variable    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div[${idx}]/div/div/a/div[@class='ui header sc-ejWHKt jFBJAy']
        Page Should Contain Element    ${xpath}
        Scroll Element Into View    ${xpath}
        ${link}=    Get WebElement    ${xpath}

        Click Element    ${link}

        Wait Until Keyword Succeeds    10s    2s    Location Should Contain    /shop/product
        ${ele_cate}=    Get Text    ${product_detail_category}

        IF    $type == 'brand'
            ${ele_cate}=    Convert To Lower Case    ${ele_cate}
            ${split_result}    Split String    ${ele_cate}    by
            ${ele_cate}    Get From List    ${split_result}    1
        ELSE IF    $type == 'category'
            ${ele_cate}=    Convert To Lower Case    ${ele_cate}
            ${split_result}    Split String    ${ele_cate}    by
            ${ele_cate}    Get From List    ${split_result}    0
        ELSE
            Fail    Not support type
        END
        
        ${ele_cate}=    Convert To Lower Case    ${ele_cate}
        Should Contain    ${ele_cate}    ${keyword}

        # go back 
        Go Back    # go back to shop page
        Location Should Be    url=${URL_SHOP}
        Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_item}
        ${location}=    Get Location
        # Log To Console    location: ${location}
    END
    

Verify result product filtered by category 
    [Arguments]    ${category}
    # check selected option 
    ${category}=    Replace String    ${category}    ${SPACE}    -

    ${cate_text}=    Get Text    //div[@class="ui dropdown"]/div[@class="divider text"]
    ${cate_text}=    Convert To Lower Case    ${cate_text}
    # Log To Console    cate_text: ${cate_text}
    Should Contain    ${cate_text}    ${category}

    # check product items category 
    ${product_items}=    Get WebElements    ${product_item}
    ${len_product_items}=    Get Length    ${product_items}
    # Log To Console    len: ${len_product_items}
    
    FOR    ${i}    IN RANGE    0    ${len_product_items}
        ${idx}=    Evaluate    ${i} + 1
        ${idx}=    Convert To String    ${idx}
        # Log To Console    idx: ${idx}

        ${xpath}=    Set Variable    //*[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div[${idx}]/div/div/a/div[@class='ui header sc-ejWHKt jFBJAy']
        Page Should Contain Element    ${xpath}
        Scroll Element Into View    ${xpath}
        ${link}=    Get WebElement    ${xpath}

        Click Element    ${link}

        Wait Until Keyword Succeeds    10s    2s    Location Should Contain    /shop/product
        ${ele_cate}=    Get Text    ${product_detail_category}
        ${ele_cate}=    Convert To Lower Case    ${ele_cate}
        Should Contain    ${ele_cate}    ${category}

        # go back 
        Go Back    # go back to shop page
        Location Should Be    url=${URL_SHOP}
        Should Contain    ${cate_text}    ${category}
        Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${product_item}
        ${location}=    Get Location
        # Log To Console    location: ${location}
    END

Verfiy result product filtered by price range 
    [Arguments]    ${min}    ${max}

    # get input value 
    ${min_value}=    Get Value    ${min_limit}
    ${max_value}=    Get Value    ${max_limit}
    IF    $min_value == ''
        ${min_value}=    Set Variable    0
    END
    IF    $max_value == ''
        ${max_value}=    Set Variable    0
    END

    # Log To Console    min_value: ${min_value}, max_value: ${max_value}, min: ${min}, max: ${max}

    # check selected option and input value
    Should Be True    ${min_value} == ${min}
    Should Be True    ${max_value} == ${max}

    Element Should Be Visible    ${reset_filter_btn}

    # check product items price
    ${product_items_price}=    Get WebElements    ${product_item_price}
    ${len_product_items}=    Get Length    ${product_items_price}
    # Log To Console    len: ${len_product_items}

    FOR    ${element}    IN    @{product_items_price}
        ${text}=    Get Text    ${element}
        ${price}=    Convert To Number    item=${text[1:]}
        # Log To Console    price: ${price}

        IF    ${min} == 0
            # Log To Console    x < ${max_value}
            Should Be True    ${price} < ${max}
        ELSE IF    ${max} == 0
            # Log To Console    x > ${min_value}
            Should Be True    ${price} > ${min}
        ELSE
            # Log To Console    min <= x <= max
            Should Be True    ${price} >= ${min}
            Should Be True    ${price} <= ${max}
        END
    END

Verify result product ordered by
    [Arguments]    ${type}    ${order}
    # check selected option
    ${type}=    Convert To Lower Case    ${type}
    ${order}=    Convert To Lower Case    ${order}

    ${btn_text}=    Get Text    ${order_by_btn}
    ${btn_text}=    Convert To Lower Case    ${btn_text}
    Should Contain    ${btn_text}    ${type}

    # get product list
    
    ${product_items_len}=    Get Element Count    ${product_item}
    # Log To Console    product_items_len: ${product_items_len}

    IF    $type == 'price'
        # ${value_path}=    Set Variable    ${product_item_price}
        ${value_path}=    Set Variable    //div[@class='ui container']/div[@class='sc-fWFeAW gWvvMA']/div/div[@class='ui segment sc-gWHAAX eUdgQa']/div[@class='ui segment sc-gWHAAX sc-ccVCaX eUdgQa kPxwND']/span/p[@class='sc-brSOsn klwJgI']
    ELSE IF    $type == 'discount rate'
        ${value_path}=    Set Variable    ${product_item_discount}
    ELSE IF    $type == 'item title'
        ${value_path}=    Set Variable    ${product_item_title}
    ELSE IF    $type == 'rating'
        ${value_path}=    Set Variable    ${product_item_rating}
    ELSE
        Fail    Not support type
    END

    ${data_list}=    Create List
    ${product_values}=    Get WebElements    ${value_path}
    
    ${len}=    Get Length    ${product_values}
    # Log To Console    len: ${len}

    FOR    ${element}    IN    @{product_values}
        ${text}=    Get Text    ${element}
        IF    $type == 'price'
            # $33.68 => 33.68
            ${text}=    Get Substring    ${text}    1  
        ELSE IF    $type == 'discount rate'
            # SAVE 17.86% => 17.86%
            ${text}=    Get Substring    ${text}    5
            # delete %
            ${text}=    Get Substring    ${text}    0    -1
        ELSE IF    $type == 'item title'
            ${text}=    Convert To Lower Case    ${text}
        ELSE IF    $type == 'rating'
            ${text}=    Get Substring    ${text}    2
        END

        Append To List    ${data_list}    ${text}

    END

    # Log To Console    product_type_items: ${data_list}
    IF    $type != 'item title'
        ${data_list}=    Evaluate    expression=[float(x) for x in ${data_list}]
    END

    # Log To Console    data_list: ${data_list}

    ${sorted_list}=    Evaluate    sorted(${data_list}, reverse=${order == 'desc'})
    # Log To Console    sorted_list: ${sorted_list}

    ${res}=    Run Keyword And Return Status    Lists Should Be Equal    ${data_list}    ${sorted_list}

    Should Be True    ${res}
