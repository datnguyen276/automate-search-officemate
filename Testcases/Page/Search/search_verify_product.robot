*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Sheet1 

Resource    ${CURDIR}/../../../Keywords/Web/Page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test Case: Verify Input Into Search Text Box
    [Tags]    search        
    [Template]    Verify Product After Searching    ${valueExisted}    
 
*** Keywords ***
Verify product after searching
    [Arguments]     ${valueExisted}
    Home.Input Value    ${valueExisted}
    Home.Click On Submit Button
    Home.Verify Total Product After Search    ${valueExisted}
    Home.Verify Product Item    ${valueExisted}
