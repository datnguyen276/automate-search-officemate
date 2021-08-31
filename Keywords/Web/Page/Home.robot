*** Settings ***
Resource    ${CURDIR}/../page/Common_Keywords.robot
Resource    ${CURDIR}/../../ObjectRepository/Home.robot

*** Variable ***
${GLOBALTIMEOUT}    ${30}

*** Keywords ***
Verify Search Textbox Is Displayed
    Home.Close Popup If It Appeared
    Element Should Be Visible          ${home.search_textbox}

Verify Placeholder
    ${placeHolder}=    SeleniumLibrary.Get Element Attribute    ${home.search_textbox}    placeholder
    Should Be Equal    ${placeHolder}                           Search all products

Verify Total Product After Search
    [Arguments]                                    ${value}
    SeleniumLibrary.Wait Until Element Contains    ${home.total_product}    ${value}    ${GLOBALTIMEOUT}

Verify Submit Button Is Displayed
    Element Should Be Visible    ${home.submit_button}

Click On Submit Button
    Common_Keywords.Click Element    ${home.submit_button}

Input Value
    [Arguments]                        ${value}
    Home.Close Popup If It Appeared
    Common_Keywords.Input Data         ${home.search_textbox}    ${value}

Close Popup If It Appeared
    Run Keyword And Ignore Error    SeleniumLibrary.Element Should Be Visible    ${home.frame}
    Run Keyword And Ignore Error    SeleniumLibrary.Select Frame                 ${home.frame}
    Run Keyword And Ignore Error    Click Element                                ${home.x_button}
    Run Keyword And Ignore Error    SeleniumLibrary.Unselect Frame

Verify Product Item
    [Arguments]                                     ${value}
    Common_Keywords.Verify Contains Text In List    ${home.product_item_result_search}    ${value}

Verify Products Suggestion
    [Arguments]                                     ${value}
    Wait To Element Visible                         ${home.suggestion_in_search}
    Common_Keywords.Verify Contains Text In List    ${home.data_suggestion_product}    ${value}

Verify Title Message
    [Arguments]                                    ${value}
    SeleniumLibrary.Wait Until Element Contains    ${home.title_message}    ${value}    ${GLOBALTIMEOUT}

