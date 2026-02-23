*** Settings ***
Resource  variables.robot

*** Keywords ***
# Given Keywords
User opens the Saucedemo login page
    New Browser  ${BROWSER}  headless=${HEADLESS}
    New Page  ${URL}
    Wait For Elements State  ${LOGIN_BUTTON}  visible

# When Keywords
User logs in with valid credentials
    Fill credentials  ${USERNAME}  ${PASSWORD}
    Click  ${LOGIN_BUTTON}

User logs in with invalid username and password
    Fill credentials  invalid_user  invalid_password
    Click  ${LOGIN_BUTTON}

User logs in with valid username and invalid password
    Fill credentials  ${USERNAME}  invalid_password
    Click  ${LOGIN_BUTTON}

User logs in with invalid username and valid password
    Fill credentials  invalid_user  ${PASSWORD}
    Click  ${LOGIN_BUTTON}

User adds Sauce Labs Backpack to cart
    Click  ${ITEM_BACKPACK}
    Click  ${ADD_TO_CART_BUTTON}

User adds Sauce Labs Bolt T-Shirt to cart
    Click  xpath=//div[@data-test="inventory-item-name" and contains(text(), "Bolt T-Shirt")]
    Click  ${ADD_TO_CART_BUTTON}

User navigates to cart
    Click  ${SHOPPING_CART_BADGE}

User proceeds to checkout
    Click  ${CHECKOUT_BUTTON}

User fills checkout information with
    [Arguments]  ${first_name}  ${last_name}  ${postal_code}
    Fill Text  ${FIRST_NAME_INPUT}  ${first_name}
    Fill Text  ${LAST_NAME_INPUT}  ${last_name}
    Fill Text  ${POSTAL_CODE_INPUT}  ${postal_code}
    Click  ${CONTINUE_BUTTON}

User finishes checkout
    Click  ${FINISH_BUTTON}
    Wait For Elements State  ${CHECKOUT_COMPLETE_CONTAINER}  visible

User removes ${item_name} from cart
    Click  id=remove-${item_name}

User continues shopping
    Click  ${CONTINUE_SHOPPING}
    Get Title  ==  Swag Labs

User tries to continue without filling any information
    Click  ${CONTINUE_BUTTON}

User fills first name ${first_name} and tries to continue without last name
    Fill Text  ${FIRST_NAME_INPUT}  ${first_name}
    Click  ${CONTINUE_BUTTON}

User fills first name ${first_name} and last name ${last_name} and tries to continue without postal code
    Fill Text  ${FIRST_NAME_INPUT}  ${first_name}
    Fill Text  ${LAST_NAME_INPUT}  ${last_name}
    Click  ${CONTINUE_BUTTON}

# Then Keywords
User should see the Swag Labs home page
    Get Title  ==  Swag Labs

User credentials are invalid error is shown
    Get Text  ${ERROR_MESSAGE}  ==  Epic sadface: Username and password do not match any user in this service

${expected_item} should be in cart
    Wait For Elements State   //div[@data-test="inventory-item-name" and normalize-space(.)="${expected_item}"]  visible

Total price should be ${expected_total}
    ${total}=  Get Text  ${TOTAL_LABEL}
    Should Be Equal  ${total}  Total: ${expected_total}

User should be redirected to home page
    Get Title  ==  Swag Labs

Item should be removed from cart
    Wait For Elements State  ${INVENTORY_ITEM_NAME}  hidden

Error message ${expected_error} should be shown
    Get Text  ${ERROR_MESSAGE}  ==  Error: ${expected_error}

# Helper Keywords
Fill credentials
    [Arguments]  ${username}  ${password}
    Fill Text  ${USER_NAME_INPUT}  ${username}
    Fill Secret  ${PASSWORD_INPUT}  $password
