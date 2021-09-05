*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Resource    ${CURDIR}/../../../Keywords/API/Common_api.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Get 


Test Template    Get Search api    

*** Test case ***
Test case: Verify api Search    ${searchQuery}    ${limit}    ${page}    ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}

*** Keywords ***
Get Search api
    [Arguments]    ${searchQuery}                   ${limit}          ${page}     ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}           ${x-newrelic-id}    ${x-store-code}
    ${res}=        Common_api.Get search product    ${searchQuery}    ${limit}    ${page}        ${store_id}        ${x_subject_id}    ${responseBody}     ${response_code}    ${cookie}           ${x-newrelic-id}    ${x-store-code}
