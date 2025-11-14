*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Click Login Button
    Click Button    xpath=//*[@id="submit"]

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
