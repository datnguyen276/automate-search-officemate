*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot

Resource    ${CURDIR}/../../../Keywords/Web/Page/Home.robot

Suite Setup       Common_Keywords.Open browser to page  ${page_url}
Suite Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test Case 1: Verify Search Text Box And Submit Button Is Displayed
    [Tags]    search
    Home.Verify Search Textbox Is Displayed
    Home.Verify Submit Button Is Displayed

Test Case 2: Verify Placeholder
    [Tags]    search
    Home.Verify Placeholder
   