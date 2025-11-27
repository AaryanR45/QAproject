*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Home Page Should Be Visible
    Wait Until Location Contains    /logged-in-successfully/    timeout=10s
    Page Should Contain Element    xpath://a[text()='Log out']

Login Error Message Should Be Visible
    Wait Until Page Contains    Your username is invalid!    timeout=5s
    Run Keyword And Ignore Error    Page Should Contain Element    xpath://*[@id="error"]
    Wait Until Page Contains    Your password is invalid!    timeout=5s
