*** Settings ***
Documentation     Module3 Cart page
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/cart_page.robot

*** Test Cases ***
TC1:Access Cart Page And Verify
    [Documentation]    Verify that the user can access the cart page
    Access Cart Page And Verify    Enter cart page directly and verify UI
    Access Cart Page And Verify    Enter cart page from tab link and verify UI

TC2:Comeback Shop Page From Cart Page
    [Documentation]    Verify that the user can return to the shop page from the cart page
    Comeback Shop Page From Cart Page    Enter page shop from tab link and verify UI
    Comeback Shop Page From Cart Page    Enter page shop from a link and verify UI

TC3:Add Product To Cart And Verify
    [Documentation]    Verify that the user can add a product to the cart and see it in the cart
    Add Product To Cart And Verify    Add product from a link from cart page and verify
    Add Product To Cart And Verify    Add product from tab link shop from cart page and verify

TC4:Remove Product From Cart And Verify
    [Documentation]    Verify that the user can remove a product from the cart
    Remove Product From Cart And Verify    Remove product and verify products by minus sign
    Remove Product From Cart And Verify    Remove product and verify products by remove link
    Remove Product From Cart And Verify    Remove product and verify products by remove all link

TC5:Update Quantity of Products in Cart
    [Documentation]    Verify that the user can update the quantity of products in the cart
    Update Quantity of Products in Cart    Add product many times and verify products by comeback shop
    Update Quantity of Products in Cart    Add product many times and verify products by increasing quantity
    Update Quantity of Products in Cart    Remove product many time and verify products by all remove link
    Update Quantity of Products in Cart    Remove product many time and verify products by minus
    Update Quantity of Products in Cart    Remove product many time and verify products empty

TC6:Verify Total Price Calculation in Cart
    [Documentation]    Verify that the total price is calculated correctly in the cart
    Verify Total Price Calculation in Cart 1 product
    Verify Total Price Calculation in Cart 2 products

TC7: Check All Problem
