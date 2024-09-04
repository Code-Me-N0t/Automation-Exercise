*** Settings ***
Resource    ../settings/main_resources.robot

*** Keywords ***
I landed in the website
    Verify If Element Is Existing            ${nav_main}

I navigated to the SignUp form
    Click Specific Element                   ${signup_nav_button}
    Verify If Element Is Existing            ${signup_page}
    Verify If Element Is Existing            ${signup_form}

I enter a username
    [Arguments]                              ${username}
    Verify If Element Is Existing            ${signup_name}
    Type A Specific Text                     ${signup_name}    
    ...                                      ${username}

I enter an email
    [Arguments]                              ${email}
    Verify If Element Is Existing            ${signup_email}
    Type A Specific Text                     ${signup_email}    
    ...                                      ${email}

I click the Signup button
    Verify If Element Is Existing            ${signup_button}
    Click Specific Element                   ${signup_button}

I should be redirected to the
    [Arguments]                              ${locator}
    Verify If Element Is Existing            ${locator}

An error message should display
    [Arguments]                              ${message}
    Verify If Text Is Existing               ${message}

A required error message should display
    [Arguments]                                ${message}    
    ...                                        ${locator}
    ${error_message}=                          Execute Javascript    
    ...      return document.querySelector("${locator}").validationMessage
    Should Be Equal As Strings    ${message}    ${error_message}