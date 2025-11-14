*** Settings ***
Documentation     Excel-driven login tests
Resource          ../resources/pages/LoginPage.robot
Resource          ../resources/pages/HomePage.robot
Resource          ../resources/keywords/BrowserKeywords.robot
Resource          ../resources/keywords/ExcelKeywords.robot
Resource          ../resources/variables/global_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Login Tests From Excel
    ${rows}=    Read Login Test Data

    FOR    ${row}    IN    @{rows}
        Log To Console    \n--- Testing user: ${row['username']} ---
        Login With Credentials    ${row['username']}    ${row['password']}

        IF    '${row["expected_result"]}' == 'pass'
            Home Page Should Be Visible
        ELSE
            Login Error Message Should Be Visible
        END

        Capture Page Screenshot    output/screenshots/${row['username']}.png
        Go To    ${BASE_URL}
    END
