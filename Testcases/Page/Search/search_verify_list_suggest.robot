*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Sheet1 

Resource    ${CURDIR}/../../../Keywords/Web/Page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***  
    
Test Case: Verify Product Suggestion    ${valueExisted}
    [Tags]    search    
    [Template]    Verify List Suggestion    

*** Keywords ***
Verify List Suggestion
    [Arguments]    ${valueExisted}
    Home.Input Value    ${valueExisted}
    Home.Verify Products Suggestion    ${valueExisted}