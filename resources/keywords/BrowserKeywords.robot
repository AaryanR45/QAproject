*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    ${is_ci}=    Get Environment Variable    CI    default=false

    IF    '${is_ci}' == 'true'
        Open Browser    ${BASE_URL}    headlesschrome
    ELSE
        Open Browser    ${BASE_URL}    chrome
        Maximize Browser Window
    END

    Set Selenium Implicit Wait    5s
    Set Selenium Timeout          15s
    Wait Until Element Is Visible    id=username    timeout=15s

Close Browser
    Close All Browsers
