*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Home Page Should Be Visible
    Wait Until Location Contains    logged-in-successfully    timeout=15s
    Wait Until Page Contains Element    xpath=//a[text()='Log out']    timeout=10s

Login Error Message Should Be Visible
    Wait Until Page Contains    Your username is invalid!    timeout=10s
    Run Keyword And Ignore Error
    ...    Page Should Contain Element    xpath=//*[@id="error"]
