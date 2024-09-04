*** Settings ***
Resource        ../settings/main_resources.robot

*** Keywords ***
Verify If Element Is Existing
    [Arguments]                        ${locator}
    Wait Until Keyword Succeeds        10s     
    ...                                1s        
    ...                                Element Should Be Visible       
    ...                                ${locator}

Verify Element Value
    [Arguments]                        ${locator}     
    ...                                ${expected-value}
    ${actual-value}                    Get Text        
    ...                                ${locator}
    Should Be Equal                    ${actual-value}     
    ...                                ${expected-value}

Get The Text
    [Arguments]                        ${locator}
    Wait Until Keyword Succeeds        10s    
    ...                                1s        
    ...                                Get Text        
    ...                                ${locator}

Click Specific Element
    [Arguments]                         ${locator}
    Wait Until Keyword Succeeds         10s     
    ...                                 1s          
    ...                                 Click Element          
    ...                                 ${locator}

Type A Specific Text
    [Arguments]                         ${locator}     
    ...                                 ${text}
    Wait Until Keyword Succeeds         10s     
    ...                                 1s      
    ...                                 Input Text      
    ...                                 ${locator}      
    ...                                 ${text}

Type A Random Text
    [Arguments]                         ${locator}
    ${random_text}=                     Generate Random String  
    ...                                 8   
    ...                                 [LETTERS]
    Input Text                          ${locator}    
    ...                                 ${random_text}
    RETURN                              ${random_text}

Type A Random Number
    [Arguments]                         ${locator}
    ${random_number}=                   Generate Random String  
    ...                                 8   
    ...                                 [NUMBERS]
    Input Text                          ${locator}    
    ...                                 ${random_number}

Verify If Text Is Existing
    [Arguments]        ${locator}
    Wait Until Keyword Succeeds         10s    
    ...                                 1s     
    ...                                 Page Should Contain        
    ...                                 ${locator}

Handle Alert Message
    Handle Alert                        action=ACCEPT

Open New Tab
    [Arguments]                         ${url}
    Execute Javascript                  window.open('${url}')

Get The Value
    [Arguments]                         ${locator}
    Wait Until Keyword Succeeds          10s    
    ...                                  1s    
    ...                                  Get Value    
    ...                                  ${locator}