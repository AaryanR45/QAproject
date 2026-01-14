*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    ${is_ci}=    Get Environment Variable    CI    default=false

    IF    '${is_ci}' == 'true'
        &{chrome_options}=    Create Dictionary
        ...    binary_location=/usr/bin/chromium
        ...    args=--headless,--no-sandbox,--disable-dev-shm-usage,--window-size=1920,1080

        Open Browser    ${BASE_URL}    chrome    options=${chrome_options}
    ELSE
        Open Browser    ${BASE_URL}    chrome
        Maximize Browser Window
    END

    Set Selenium Implicit Wait    5s
    Set Selenium Timeout    15s
    Wait Until Element Is Visible    id=username    timeout=15s

Close Browser
    Close All Browsers
