*** Settings ***
Documentation     Module1 - Shop page 
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource           ../resources/shop_page.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Variables ***
${key_title_name}    wrist
${relative_key_title_name}    wris
${key_brand_name}    Eastern Watches
${relative_key_brand_name}    Easter
${key_category_name}    womens-watches
${relative_key_category_name}    womens-
${key_not_found}    glasses
${key_abnormal_char}    wrist_*

*** Test Cases ***
TC1: Verify Access To Shop page directly
    [Documentation]    Verify Access To Shop page directly
    Enter page shop directly

TC2: Verify Access To Shop page from Home page
    [Documentation]    Verify Access To Shop page from Home page
    Enter page shop from shop now button and verify ui

TC3: Verify Access To Shop page from Nav Link 
    [Documentation]    Verify Access To Shop page from Nav Link 
    Enter page shop from tab link and verify ui

TC4: Verify search - no input 
    [Documentation]    Verify search - no input
    Enter page shop directly
    Seach product no keyword

TC5: Check search submit action - no input 
    [Documentation]    Check search submit action
    Enter page shop directly
    Search with no key word & Press Enter
    Search with no key word & Press Enter

TC6: Check search submit action - with input & Enter
    [Documentation]    Check search submit action
    Enter page shop directly
    Search with key word & Press Enter    ${key_title_name}
    Verify search result with keyword product name    ${key_title_name}

TC7: Check search submit action - with input & Click
    [Documentation]    Check search submit action
    Enter page shop directly
    Search product    ${key_title_name}
    Verify search result with keyword product name    ${key_title_name}

TC8: Verify search absolute - with input (product name)
    [Documentation]    Verify search - with input (product title)
    Enter page shop directly
    Search product    ${key_title_name}
    Verify search result with keyword product name    ${key_title_name}

TC9: Verify search absolute - with input (brand)
    [Documentation]    Verify search - with input (brand)
    Enter page shop directly
    Search product    ${key_brand_name}
    Verify search result with keyword product details    brand    ${key_brand_name}

TC10: Verify search absolute - with input (category)
    [Documentation]    Verify search - with input (category)
    Enter page shop directly
    Search product    ${key_category_name}
    Verify search result with keyword product details    category    ${key_category_name}

TC11: Verify search relative - with input (product name)
    [Documentation]    Verify search - with input (product title)
    Enter page shop directly
    Search product    ${relative_key_title_name}
    Verify search result with keyword product name    ${relative_key_title_name}

TC12: Verify search relative - with input (brand)
    [Documentation]    Verify search - with input (brand)
    Enter page shop directly
    Search product    ${relative_key_brand_name}
    Verify search result with keyword product details    brand    ${relative_key_brand_name}

TC13: Verify search relative - with input (category)
    [Documentation]    Verify search - with input (category)
    Enter page shop directly
    Search product    ${relative_key_category_name}
    Verify search result with keyword product details    category    ${relative_key_category_name}

TC14: Verify search - with keyword not exist
    [Documentation]    Verify search - with keyword not exist
    Enter page shop directly
    Search with keyword not exist    ${key_not_found}

TC15: Verify search - with abnormal character
    [Documentation]    Verify search - with abnormal character
    Enter page shop directly
    Search with keyword not exist    ${key_abnormal_char}

TC16: Verify filter category - smartphones 
    [Documentation]    Verify filter category - smartphones
    Enter page shop directly
    Filter by category    smartphones    0
    Verify result product filtered by category    smartphones

# smartphones, laptops, frangrances, skincares, groceries, home decoration, furniture, tops, womens dresses, womens shoes, mens shirt, mens shoes, mens watches, womens watches
TC17: Verify filter category - laptops
    [Documentation]    Verify filter category - laptops
    Enter page shop directly
    Filter by category    laptops    1
    Verify result product filtered by category    laptops

TC18: Verify filter category - fragrances
    [Documentation]    Verify filter category - frangrances
    Enter page shop directly
    Filter by category    fragrances    2
    Verify result product filtered by category    fragrances

TC19: Verify filter category - skincare
    [Documentation]    Verify filter category - skincares
    Enter page shop directly
    Filter by category    skincare    3
    Verify result product filtered by category    skincare

TC20: Verify filter category - groceries
    [Documentation]    Verify filter category - groceries
    Enter page shop directly
    Filter by category    groceries    4
    Verify result product filtered by category    groceries

TC21: Verify filter category - home decoration
    [Documentation]    Verify filter category - home decoration
    Enter page shop directly
    Filter by category    home decoration    5
    Verify result product filtered by category    home

TC22: Verify filter category - furniture
    [Documentation]    Verify filter category - furniture
    Enter page shop directly
    Filter by category    furniture    6
    Verify result product filtered by category    furniture

TC23: Verify filter category - tops
    [Documentation]    Verify filter category - tops
    Enter page shop directly
    Filter by category    tops    7
    Verify result product filtered by category    tops

TC24: Verify filter category - womens dresses
    [Documentation]    Verify filter category - womens dresses
    Enter page shop directly
    Filter by category    womens dresses    8
    Verify result product filtered by category    womens

TC25: Verify filter category - womens shoes
    [Documentation]    Verify filter category - womens shoes
    Enter page shop directly
    Filter by category    womens shoes    9
    Verify result product filtered by category    womens

TC26: Verify filter category - mens shirt
    [Documentation]    Verify filter category - mens shirt
    Enter page shop directly
    Filter by category    mens shirt    10
    Verify result product filtered by category    mens

TC27: Verify filter category - mens shoes
    [Documentation]    Verify filter category - mens shoes
    Enter page shop directly
    Filter by category    mens shoes    11
    Verify result product filtered by category    mens

TC28: Verify filter category - mens watches
    [Documentation]    Verify filter category - mens watches
    Enter page shop directly
    Filter by category    mens watches    12
    Verify result product filtered by category    mens

TC29: Verify filter category - womens watches
    [Documentation]    Verify filter category - womens watches
    Enter page shop directly
    Filter by category    womens watches    13
    Verify result product filtered by category    womens

### Verify price range filter ###
TC30: Verify filter price range - 0-50
    [Documentation]    Verify filter price range - 0-100
    Enter page shop directly
    Filter by price range    0
    Verfiy result product filtered by price range    0    50

TC31: Verify filter price range - 50-200
    [Documentation]    Verify filter price range - 50-200
    Enter page shop directly
    Filter by price range    1
    Verfiy result product filtered by price range    50    200

TC32: Verify filter price range - 200-500
    [Documentation]    Verify filter price range - 200-500
    Enter page shop directly
    Filter by price range    2
    Verfiy result product filtered by price range    200    500

TC33: Verify filter price range - 500-1000
    [Documentation]    Verify filter price range - 500-1000
    Enter page shop directly
    Filter by price range    3
    Verfiy result product filtered by price range    500    1000

TC34: Verify filter price range > 1000
    [Documentation]    Verify filter price range >  1000
    Enter page shop directly
    Filter by price range    4
    Verfiy result product filtered by price range    1000    0

### Filter order by filter ###
# Sort desc by: price, discount rate, item title, rating
TC35: Verify filter order by - price - desc
    [Documentation]    Verify filter order by - price
    Enter page shop directly
    Filter order by    price
    Sort product list    desc
    Verify result product ordered by    price    desc

TC36: Verify filter order by - discount rate - desc
    [Documentation]    Verify filter order by - discount rate
    Enter page shop directly
    Filter order by    discount rate
    Sort product list    desc
    Verify result product ordered by    discount rate    desc

TC37: Verify filter order by - item title - desc
    [Documentation]    Verify filter order by - item title
    Enter page shop directly
    Filter order by    item title
    Sort product list    desc
    Verify result product ordered by    item title    desc

TC38: Verify filter order by - rating - desc
    [Documentation]    Verify filter order by - rating
    Enter page shop directly
    Filter order by    rating
    Sort product list    desc
    Verify result product ordered by    rating    desc

# Sort asc by: price, discount rate, item title, rating
TC39: Verify filter order by - price - asc
    [Documentation]    Verify filter order by - price
    Enter page shop directly
    Filter order by    price
    Sort product list    asc
    Verify result product ordered by    price    asc

TC40: Verify filter order by - discount rate - asc
    [Documentation]    Verify filter order by - discount rate
    Enter page shop directly
    Filter order by    discount rate
    Sort product list    asc
    Verify result product ordered by    discount rate    asc

TC41: Verify filter order by - item title - asc
    [Documentation]    Verify filter order by - item title
    Enter page shop directly
    Filter order by    item title
    Sort product list    asc
    Verify result product ordered by    item title    asc

TC42: Verify filter order by - rating - asc
    [Documentation]    Verify filter order by - rating
    Enter page shop directly
    Filter order by    rating
    Sort product list    asc
    Verify result product ordered by    rating    asc

### Filter product with multiple filters ###
TC43: Verify multiple filter (category, price range, order by)
    [Documentation]    Verify multiple filter (category, price range, order by)
    Enter page shop directly
    Filter by category    home decoration    5
    Filter by price range    0
    Filter order by    price
    Sort product list    desc
    Verify result product filtered by category    home decoration
    Verfiy result product filtered by price range    0    50
    Verify result product ordered by    price    desc

TC44: Verify multiple filter (search, price range, order by)
    [Documentation]    Verify multiple filter (search, price range, order by)
    Enter page shop directly
    Search product    wrist
    Filter by price range    0
    Filter order by    discount rate
    Sort product list    asc
    Verify search result with keyword product name    wrist
    Verfiy result product filtered by price range    0    50
    Verify result product ordered by    discount rate    asc
    
### Verify reset filter ###
TC45: Verify reset filter (category, price range, order by)
    [Documentation]    Verify reset filter
    Enter page shop directly
    Filter by category    laptops    1
    Filter by price range    4
    Filter order by    price
    Sort product list    desc

    Reset filter and verify

TC46: Verify reset filter (search, price range, order by)
    [Documentation]    Verify reset filter
    Enter page shop directly
    Search product    wrist
    Filter by price range    0
    Filter order by    discount rate
    Sort product list    asc

    Reset filter and verify

TC47: Verify reset filter (search, category, order by)
    [Documentation]    Verify reset filter
    Enter page shop directly
    Search product    book
    Filter by category    laptops    1
    Filter order by    discount rate
    Sort product list    asc

    Reset filter and verify

TC48: Verify reset filter (search, category, price range, order by, sort)
    [Documentation]    Verify reset filter
    Enter page shop directly
    Search product    perfume
    Filter by category    fragrances    2
    Filter by price range    0
    Filter order by    discount rate
    Sort product list    asc

    Reset filter and verify

