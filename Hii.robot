*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Chrome Browser
    Open Browser    https://www.google.com    chrome
    Sleep    3s
    Close Browser
