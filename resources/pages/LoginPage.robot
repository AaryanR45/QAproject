*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/BrowserKeywords.robot
Resource   ../../variables/global_variables.robot

*** Variables ***
${LOGIN_URL}    https://practicetestautomation.com/practice-test-login/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id:username    timeout=10s

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id:username    timeout=10s
    Input Text     id:username    ${username}
    Input Text     id:password    ${password}
    Click Button   id:submit

Login Error Message Should Be Visible
    Wait Until Page Contains    Your username is invalid!    timeout=5s
