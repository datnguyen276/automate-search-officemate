*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot

Resource    ${CURDIR}/../../../Keywords/Web/page/Home.robot

Suite Setup       Common_Keywords.Open browser to page  ${page_url}
Suite Teardown    SeleniumLibrary.Close Browser

***Test Cases***
Test case 1: Verify search text box and submit button is displayed
    [Tags]    search
    Home.Verify search textbox is displayed
    Home.Verify submit button is displayed

Test case: Verify placeholder
    [Tags]    search
    Home.Verify placeholder
   