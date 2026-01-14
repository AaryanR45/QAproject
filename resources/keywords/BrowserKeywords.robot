*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    BuiltIn
Resource   ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    ${is_ci}=    Get Environment Variable    CI    default=false

    IF    '${is_ci}' == 'true'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --window-size=1920,1080
        Call Method    ${options}    add_argument    --disable-gpu
        Set To Dictionary    ${options}    binary_location=/usr/bin/chromium

        Open Browser    ${BASE_URL}    chrome    options=${options}
    ELSE
        Open Browser    ${BASE_URL}    chrome
        Maximize Browser Window
    END

    Set Selenium Implicit Wait    5s
    Set Selenium Timeout    15s
    Wait Until Element Is Visible    id=username    timeout=15s

Close Browser
    Close All Browsers
