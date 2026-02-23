*** Settings ***
Library  Browser
Resource  ../resources/keywords.robot
Resource  ../resources/variables.robot
Test Teardown  Close Browser

*** Test Cases ***
User can log in to portal successfully
    [Documentation]  Verify that user can log in with valid credentials and is redirected to home page
    [Tags]  login  regression
    Given user opens the Saucedemo login page
    When user logs in with valid credentials
    Then user should see the Swag Labs home page

User cannot log in to portal with invalid credentials
    [Documentation]  Verify that user cannot log in with invalid credentials and appropriate error message is shown
    [Tags]  login  regression
    Given user opens the Saucedemo login page
    When user logs in with invalid username and password
    Then user credentials are invalid error is shown
    When user logs in with valid username and invalid password
    Then user credentials are invalid error is shown
    When user logs in with invalid username and valid password
    Then user credentials are invalid error is shown

User can complete purchase successfully
    [Documentation]  Verify that user can complete purchase successfully and is redirected to home page
    [Tags]  purchase  regression
    Given user opens the Saucedemo login page
    When user logs in with valid credentials
    And user adds Sauce Labs Backpack to cart
    And user navigates to cart
    Then Sauce Labs Backpack should be in cart
    When user proceeds to checkout
    And user fills checkout information with  John  Doe  12345
    Then total price should be $32.39
    When user finishes checkout
    Then user should be redirected to home page

User cannot proceed to checkout without filling required information
    [Documentation]  Verify that user cannot proceed to checkout without filling required information
    [Tags]  purchase  regression
    Given user opens the Saucedemo login page
    When user logs in with valid credentials
    And user adds Sauce Labs Backpack to cart
    And user navigates to cart
    When user proceeds to checkout
    And user tries to continue without filling any information
    Then error message First Name is required should be shown
    When user fills first name John and tries to continue without last name
    Then error message Last Name is required should be shown
    When user fills first name John and last name Doe and tries to continue without postal code
    Then error message Postal Code is required should be shown

User can add multiple items to cart and complete purchase successfully
    [Documentation]  Verify that user can add multiple items to cart and complete purchase successfully
    [Tags]  purchase  regression
    Given user opens the Saucedemo login page
    When user logs in with valid credentials
    And user adds Sauce Labs Backpack to cart
    Click  ${BACK_TO_PRODUCTS}
    And user adds Sauce Labs Bolt T-Shirt to cart
    And user navigates to cart
    Then Sauce Labs Backpack should be in cart
    And Sauce Labs Bolt T-Shirt should be in cart
    When user proceeds to checkout
    And user fills checkout information with  John  Doe  12345
    Then total price should be $49.66
    When user finishes checkout
    Then user should be redirected to home page

User can remove item from cart and continue shopping
    [Documentation]  Verify that user can add item to cart, remove it and continue shopping
    [Tags]  purchase  regression
    Given user opens the Saucedemo login page
    When user logs in with valid credentials
    And user adds Sauce Labs Backpack to cart
    And user navigates to cart
    Then Sauce Labs Backpack should be in cart
    When user removes sauce-labs-backpack from cart
    Then item should be removed from cart
    When user continues shopping
    Then user should see the Swag Labs home page