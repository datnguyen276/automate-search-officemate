*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Resource    ${CURDIR}/../../../Keywords/API/Common_api.robot
Library     DataDriver                                           ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Get 


Test Template    Get Search Api   

*** Test case ***
Test case: Verify Api Search    ${searchQuery}    ${limit}    ${page}    ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}

*** Keywords ***
Get Search Api
    [Arguments]    ${searchQuery}                   ${limit}          ${page}     ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}           ${x-newrelic-id}    ${x-store-code}
    ${res}=        Common_api.Get Search Product    ${searchQuery}    ${limit}    ${page}        ${store_id}        ${x_subject_id}    ${responseBody}     ${response_code}    ${cookie}           ${x-newrelic-id}    ${x-store-code}
