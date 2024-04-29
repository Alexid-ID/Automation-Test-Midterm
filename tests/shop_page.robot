*** Settings ***
Documentation     Module1 - Shop page 
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource           ../resources/shop_page.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Variables ***

*** Test Cases ***
TC1: Verify Access To Shop page
    Enter page shop directly
    Enter page shop from shop now button and verify ui
    Enter page shop from tab link and verify ui

# TC2: Verify Search Functionality
TC2: Verify seach - no input 
    Enter page shop directly

TC3: Verify search - with input (product name)
    Enter page shop directly
    Search by product name    wrist
