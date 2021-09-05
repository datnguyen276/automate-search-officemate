*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Search 
# C:\Users\DCG\Documents\Smart\linhtt1_qa_automation\TestData\Officemate.xlsx

Resource    ${CURDIR}/../../../Keywords/Web/page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***  
    
Test case 2: Verify product suggestion    ${valueExisted}
    [Tags]    search    
    [Template]    Verify list suggestion     

*** Keywords ***
Verify list suggestion
    [Arguments]    ${valueExisted}
    Home.Input value    ${valueExisted}
    Home.Verify products suggestion    ${valueExisted}