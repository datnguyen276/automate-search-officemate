*** Settings ***
Resource    ${CURDIR}/../page/Common_Keywords.robot
Resource    ${CURDIR}/../../ObjectRepository/Home.robot

*** Variable ***
${GLOBALTIMEOUT}    ${30}

*** Keywords ***
Verify search textbox is displayed
    Home.Close popup if it appeared
    Element Should Be Visible          ${home.search_textbox}

Verify placeholder
    ${placeHolder}=    SeleniumLibrary.Get Element Attribute    ${home.search_textbox}    placeholder
    Should Be Equal    ${placeHolder}                           Search all products

Verify total product after search
    [Arguments]                                    ${value}
    SeleniumLibrary.Wait Until Element Contains    ${home.total_product}    ${value}    ${GLOBALTIMEOUT}

Verify submit button is displayed
    Element Should Be Visible    ${home.submit_button}

Click on submit button
    Common_Keywords.Click Element    ${home.submit_button}

Input value
    [Arguments]                        ${value}
    Home.Close popup if it appeared
    Common_Keywords.Input data         ${home.search_textbox}    ${value}

Close popup if it appeared
    Run Keyword And Ignore Error    SeleniumLibrary.Element Should Be Visible    ${home.frame}
    Run Keyword And Ignore Error    SeleniumLibrary.Select Frame                 ${home.frame}
    Run Keyword And Ignore Error    Click Element                                ${home.x_button}
    Run Keyword And Ignore Error    SeleniumLibrary.Unselect Frame

Verify product item
    [Arguments]                                     ${value}
    ${product_suggestion}=    Convert To Upper Case    ${value}
    Common_Keywords.Verify contains text in list    ${home.product_item_result_search}    ${product_suggestion}

Verify products suggestion
    [Arguments]                                     ${value}
    Wait To Element Visible                         ${home.suggestion_in_search}
    ${product_suggestion}=    Convert To Upper Case    ${value}
    Common_Keywords.Verify contains text in list    ${home.data_suggestion_product}    ${product_suggestion}

Verify title message
    [Arguments]                                    ${value}
    SeleniumLibrary.Wait Until Element Contains    ${home.title_message}    ${value}    ${GLOBALTIMEOUT}

