*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Sheet1 

Resource    ${CURDIR}/../../../Keywords/Web/Page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test Case: Verify Message When Searching Data Is Not Exist In Db
    [Tags]    search    
    [Template]    Verify Message    ${valueNotExisted}    

*** Keywords ***
Verify Message
    [Arguments]     ${valueNotExisted}
    Home.Input Value    ${valueNotExisted}
    Home.Click On Submit Button
    Home.Verify Title Message    ${valueNotExisted}    