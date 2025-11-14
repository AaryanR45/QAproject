*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Close Browser
    Close All Browsers
