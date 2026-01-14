*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    id=username    timeout=10s
    Input Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    id=password    timeout=10s
    Input Text    id=password    ${password}

Click Login Button
    Wait Until Element Is Enabled    xpath=//*[@id="submit"]    timeout=10s
    Click Button    xpath=//*[@id="submit"]

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
