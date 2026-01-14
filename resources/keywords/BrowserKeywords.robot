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
    END

    Set Window Size    1920    1080
    Set Selenium Implicit Wait    5s
    Set Selenium Timeout    15s
    Wait Until Page Contains Element    id=username    timeout=15s

Close Browser
    Close All Browsers
