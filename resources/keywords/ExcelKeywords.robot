*** Settings ***
Library    RPA.Excel.Files
Resource   ../variables/global_variables.robot

*** Keywords ***
Read Login Test Data
    Open Workbook    ${EXCEL_FILE}
    ${rows}=    Read Worksheet As Table    header=True
    Close Workbook
    RETURN    ${rows}
