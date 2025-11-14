*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Login Error Message Should Be Visible
    Wait Until Page Contains    Invalid credentials    timeout=5
