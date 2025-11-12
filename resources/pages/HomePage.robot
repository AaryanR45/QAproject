*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Home Page Should Be Visible
    Wait Until Page Contains    Logged In Successfully
    Page Should Contain Element    xpath://a[text()='Log out']
