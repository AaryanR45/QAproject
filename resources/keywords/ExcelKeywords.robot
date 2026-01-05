*** Settings ***
Library    RPA.Excel.Files
Library    Collections
Resource   ../variables/global_variables.robot

*** Keywords ***
Read Login Test Data
    Open Workbook    ${EXCEL_FILE}
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    RETURN    @{table}   # return table rows as a list of dicts

Get Login Test Row
    [Arguments]    ${row_index}
    ${all_rows}=    Read Login Test Data
    ${index}=    Evaluate    ${row_index} - 1
    ${row}=    Get From List    ${all_rows}    ${index}
    RETURN    ${row}
