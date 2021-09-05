*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Search 

Resource    ${CURDIR}/../../../Keywords/Web/page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test case 3: Verify message when searching data is not exist in db    ${valueNotExisted}
    [Template]    Verify message

*** Keywords ***
Verify message
    [Arguments]     ${valueNotExisted}
    Home.Input value    ${valueNotExisted}
    Home.Click on submit button
    Home.Verify title message    ${valueNotExisted}    