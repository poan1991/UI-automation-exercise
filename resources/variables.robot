*** Variables ***
${BROWSER}  chromium
${HEADLESS}  True
${URL}  https://www.saucedemo.com
${USERNAME}  standard_user
${PASSWORD}  secret_sauce

# Login Page Locators
${LOGIN_BUTTON}  id=login-button
${USER_NAME_INPUT}  id=user-name
${PASSWORD_INPUT}  id=password

# Error Messages
${ERROR_MESSAGE}  [data-test=error]

# Cart Locators
${SHOPPING_CART_BADGE}  [data-test=shopping-cart-badge]
${INVENTORY_ITEM_NAME}  [data-test=inventory-item-name]
${ADD_TO_CART_BUTTON}  id=add-to-cart

# Product Locators
${ITEM_BACKPACK}  xpath=//div[@data-test="inventory-item-name" and contains(text(), "Backpack")]
${ITEM_BOLT_T_SHIRT}  xpath=//div[@data-test="inventory-item-name" and contains(text(), "Bolt T-Shirt")]

# Checkout Locators
${CHECKOUT_BUTTON}  id=checkout
${CONTINUE_SHOPPING}  id=continue-shopping
${FIRST_NAME_INPUT}  id=first-name
${LAST_NAME_INPUT}  id=last-name
${POSTAL_CODE_INPUT}  id=postal-code
${CONTINUE_BUTTON}  id=continue
${FINISH_BUTTON}  id=finish
${CHECKOUT_COMPLETE_CONTAINER}  id=checkout_complete_container
${BACK_TO_PRODUCTS}  id=back-to-products

# Total Price Locator
${TOTAL_LABEL}  [data-test=total-label]
