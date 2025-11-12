*** Settings ***
Documentation     Verify login functionality
Resource          ../resources/pages/LoginPage.robot
Resource          ../resources/pages/HomePage.robot
Resource          ../resources/keywords/BrowserKeywords.robot
Resource          ../variables/global_variables.robot
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser


*** Test Cases ***
Valid Login Should Succeed
    [Documentation]    Verify user can login successfully with valid credentials
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Home Page Should Be Visible

Invalid Login Should Fail
    [Documentation]    Verify user cannot login with invalid credentials
    Login With Credentials    invalid_user    wrong_pass
    Login Error Message Should Be Visible
