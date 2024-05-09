*** Settings ***
Documentation     Module1 - Shop page
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/product_detail_page.robot

*** Test Cases ***
TC1: Access to product page
    Enter product page from shop page and verify
    Enter another product page from shop and verify

TC2: Check page and verify product
    Verify right name price product
    Test droplist and verify

TC3: Select products from list and add to cart and verify
    Select products from list and add to cart and verify

TC4: Select all products from list and add to cart and verify
    Select all products from list and add to cart and verify

TC5: Select number products and all product from list add to cart and verify
    Select number products and all product from list add to cart and verify

TC6: Remove added items from cart
    Remove added items from cart

TC7: Test related products
    Test Columns Existence
    Test Images Src
    Test Product Titles
