*** Settings ***
Resource    ${CURDIR}/../../../Libs/libs.robot
Resource    ${CURDIR}/../../../Keywords/API/Common_api.robot
Library     DataDriver    ${CURDIR}/../../../TestData/Officemate.xlsx    sheet_name=Post 


Test Template    Post Search api    

*** Test case ***
Test case: Verify api Search    ${searchQuery}      ${limit}    ${page}    ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}

*** Keywords *** 
Post Search api
    [Arguments]    ${searchQuery}      ${limit}    ${page}    ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}
    ${res}=    Common_api.POST search product    ${searchQuery}      ${limit}    ${page}    ${store_id}    ${x_subject_id}    ${responseBody}    ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}
