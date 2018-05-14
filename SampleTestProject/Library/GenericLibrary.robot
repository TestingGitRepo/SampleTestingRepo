*** Settings ***
Resource          ../Resource/Common.robot

*** Variables ***
${testsheetname}    Sheet1
${rownum}         ${EMPTY}
${IN_Username}    ${EMPTY}
${TestdataFile}    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\Inputdata.xls
${IN_Password}    ${EMPTY}
${colNum}         ${EMPTY}
${IN_Path}        ${EMPTY}

*** Keywords ***
Get cell value from excel
    [Arguments]    ${sSheetName}    ${sTestCaseNo}    ${sColumnName}
    log    ${sColumnName}
    ${colCount}    Get Column Count    ${sSheetName}
    Log    ${colCount}
    : FOR    ${y}    IN RANGE    0    ${colCount}
    \    ${header}    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${y}    0
    \    Log    ${header}
    \    #Check if this is the given header
    \    Run Keyword If    "${header}"=="${sColumnName}"    Set Test Variable    ${colNum}    ${y}
    Log    "column number is" ${colNum}
    #Get the total rows in the Sheet
    ${iTotalRows}    ExcelLibrary.Get Row Count    ${sSheetName}
    Log    "Row number is"${iTotalRows}
    : FOR    ${iRowNo}    IN RANGE    0    ${iTotalRows}
    \    ${TC_Num}    Read Cell Data By Coordinates    ${sSheetName}    0    ${iRowNo}
    \    #Incase TestCase No is same , fetch the data from same row and given column No
    \    ${sSearchedData}    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${colNum}
    \    ...    ${iRowNo}
    \    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Exit For Loop
    [Return]    ${sSearchedData}

Test Initialization
    [Arguments]    ${rownum}    ${testsheetname}
    Open excel    ${TestdataFile}
    Set Global Variable    ${rownum}    ${rownum}
    ${path}=    Get cell value from excel    ${testsheetname}    ${rownum}    Path    #column name
    Set Suite Variable    ${IN_Path}    ${path}
    Log    ${IN_Path}
    ${username}=    Get cell value from excel    ${testsheetname}    ${rownum}    Username
    Set Suite Variable    ${IN_Username}    ${username}
    Log    ${IN_Username}
    ${password}=    Get cell value from excel    ${testsheetname}    ${rownum}    Password
    Set Suite Variable    ${IN_Password}    ${password}
    Log    ${IN_Password}

GetValuesFromNotepad
    ${Test}=    Get File    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\TestFile.txt    encoding=UTF-8    encoding_errors=strict
