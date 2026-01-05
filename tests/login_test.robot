*** Settings ***
Documentation     Login tests
Resource          ../resources/pages/LoginPage.robot
Resource          ../resources/pages/HomePage.robot
Resource          ../resources/keywords/BrowserKeywords.robot
Resource          ../resources/keywords/ExcelKeywords.robot
Resource          ../resources/variables/global_variables.robot
Library           SeleniumLibrary

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Keywords ***
Pause To See Alert
    [Arguments]    ${scroll_px}=100    ${pause_s}=3
    # Scroll down slightly so alert is visible
    Execute JavaScript    window.scrollBy(0, ${scroll_px})
    # Pause for observation
    Sleep    ${pause_s}s

*** Test Cases ***
Login Test Row 1
    ${row}=    Get Login Test Row    1
    Log To Console    \n--- Testing user: ${row['username']} ---
    Login With Credentials    ${row['username']}    ${row['password']}

    IF    '${row["expected_result"]}' == 'pass'
        Home Page Should Be Visible
    ELSE
        Login Error Message Should Be Visible
        Pause To See Alert
    END

    Go To    ${BASE_URL}

Login Test Row 2
    ${row}=    Get Login Test Row    2
    Log To Console    \n--- Testing user: ${row['username']} ---
    Login With Credentials    ${row['username']}    ${row['password']}

    IF    '${row["expected_result"]}' == 'pass'
        Home Page Should Be Visible
    ELSE
        Login Error Message Should Be Visible
        Pause To See Alert
    END

    Go To    ${BASE_URL}

Login Test Row 3
    ${row}=    Get Login Test Row    3
    Log To Console    \n--- Testing user: ${row['username']} ---
    Login With Credentials    ${row['username']}    ${row['password']}

    IF    '${row["expected_result"]}' == 'pass'
        Home Page Should Be Visible
    ELSE
        Login Error Message Should Be Visible
        Pause To See Alert
    END

    Go To    ${BASE_URL}
