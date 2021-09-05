*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Search 

Resource    ${CURDIR}/../../../Keywords/Web/page/Home.robot
   
Test Setup       Common_Keywords.Open browser to page  ${page_url}
Test Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test case 1: Verify input into search text box    ${valueExisted}
    [Tags]    search        
    [Template]    Verify product after searching
 
*** Keywords ***
Verify product after searching
    [Arguments]     ${valueExisted}
    Home.Input value    ${valueExisted}
    Home.Click on submit button
    Home.Verify total product after search    ${valueExisted}
    Home.Verify product item    ${valueExisted}
