*** Settings ***
Resource    ${CURDIR}/../../../../imports/mobile_imports.robot

Suite Setup    common_mobile_app_keywords.Open CDS Application with additional caps
Suite Teardown    common_mobile_app_keywords.Close CDS Application

Force Tags    app_pre_prod

*** Keywords ***
Search product by keywords and verify product list page works correctly
    [Arguments]    ${keyword}    ${sort_option}    ${filter_type}    ${selected_filter_option}    ${isHomePage}=${False}
    Run Keyword If    '${isHomePage}'=='${False}'    verify_product_plp_common_keywords.Back to home page after searching product
    search_android_keywords.Search product by Keyword    ${keyword}
    verify_product_plp_common_keywords.Verify product detail page works correctly with multi filter    ${sort_option}
    ...    ${filter_type}    ${selected_filter_option}

*** Test Cases ***
Verify product list page works correctly
    [Tags]    plp_page    testrailid:C978343
    [Documentation]    - *Member Type*              : Guest
    ...                - *Keywords*                 : Regular and extra character keyword
    [Setup]    common_android_mobile_app_keywords.android Setup CDS Application by Guest
    [Template]    Search product by keywords and verify product list page works correctly
    ${search_keywords.lipstick}    ${product_list_page_dto.sort.price_low_high}    ${product_list_page_dto.filter.delivery_method.android}    ${product_list_page_dto.filter.delivery_options.standard_delivery}    ${True}
    ${search_keywords.extra_char_keywords}    ${product_list_page_dto.sort.new_arrivals}    ${product_list_page_dto.filter.delivery_method.android}    ${product_list_page_dto.filter.delivery_options.standard_delivery}
