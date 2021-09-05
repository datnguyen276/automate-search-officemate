*** Settings ***
Resource    ${CURDIR}/../Libs/libs.robot

Resource    ${CURDIR}/../Resources/Web/page/Home.robot
Resource    ${CURDIR}/../Resources/Web/page/Common_Keywords.robot
Library    DataDriver    ${CURDIR}/../TestData/Officemate.xlsx    sheet_name=Search    

Suite Setup       Common_Keywords.Open browser to page  ${page_url}
Suite Teardown    SeleniumLibrary.Close Browser
# Test Template     Input into search textbox with multi data

*** Test Cases ***
# Test case 1: Verify search text box and submit button is displayed
#     Home.Verify search textbox is displayed
#     Home.Verify submit button is displayed

Test case 2: Verify input into search text box    ${value}
    [Template]    Input into search textbox with multi data

*** Keywords ***
Input into search textbox with multi data
    [Arguments]     ${value}
    Home.Input value into search textbox    ${value}
    Home.Click on submit button
    Home.Verify product

# Test case 3: Verify list suggest item
#    Home.Click on search text box
#    Home.List suggest item should be displayed

# Test case 3: Verify per page default of searching result
#    Home.Verify perpage default
#    Home.Verify pagination

