*** Settings ***
Resource    ${CURDIR}/../../Libs/libs.robot

*** Keywords ***
Get search product
    [Arguments]    ${searchQuery}       ${limit}                      ${page}                           ${store_id}                     ${x_subject_id}         ${responseBody}                 ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}
    ${param}=      Create Dictionary    searchQuery=${searchQuery}    limit=${limit}                    page=${page}                    store_id=${store_id}    x_subject_id=${x_subject_id}    
    ${header}=     Create Dictionary    cookie=${cookie}              x-newrelic-id=${x-newrelic-id}    x-store-code=${x-store-code}

    ${status}       ${value}=                       Run Keyword And Ignore Error    RequestsLibrary.GET           ${api_url}/search/products    ${param}             headers=${header}
    ${flag}         Evaluate                        type($value)

    Run Keyword If    '${status}'=='PASS'    Status Should Be    ${response_code}    ${value}
    Run Keyword If    '${status}'=='FAIL'    Should Contain      ${value}            ${response_code}    

POST search product
    [Arguments]    ${searchQuery}       ${limit}                      ${page}                           ${store_id}                     ${x_subject_id}         ${responseBody}                 ${response_code}    ${cookie}    ${x-newrelic-id}    ${x-store-code}
    ${param}=      Create Dictionary    searchQuery=${searchQuery}    limit=${limit}                    page=${page}                    store_id=${store_id}    x_subject_id=${x_subject_id}    
    ${header}=     Create Dictionary    cookie=${cookie}              x-newrelic-id=${x-newrelic-id}    x-store-code=${x-store-code}

    ${status}       ${value}=                       Run Keyword And Ignore Error    RequestsLibrary.Post    ${api_url}/search/products    ${param}    headers=${header}
    Run Keyword If    '${status}'=='PASS'    Status Should Be    ${response_code}    ${value}
    Run Keyword If    '${status}'=='FAIL'    Should Contain      ${value}            ${response_code}  