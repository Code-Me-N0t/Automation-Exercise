*** Settings ***
Resource        ../settings/main_resources.robot
Test Setup        Launch Testing Website        ${website_url}
Test Teardown        Main Teardown

*** Test Cases ***
Test Scenario 1: Sign Up with New Credentials
    [Tags]    REGISTER
    Given I landed in the website
    And I navigated to the SignUp form
    And I enter a username                    ${sample_username}
    And I enter an email                      ${sample_email}
    When I click the Signup button
    Then I should be redirected to the        ${login_form}
    
Test Scenario 2: Sign up with Existing Credentials
    [Tags]    EXISTING
    Given I landed in the website
    And I navigated to the SignUp form
    And I enter a username                        ${sample_username}
    And I enter an email                          sample@gmail.com
    When I click the Signup button
    Then An error message should display          ${already_exist}

Test Scenario 3: Empty username 
    [Tags]    NEGATIVE    USERNAME
    Given I landed in the website
    And I navigated to the SignUp form
    And I enter an email                            sample@gmail.com
    When I click the Signup button
    Then A required error message should display    ${should_be_filled_out}    
    ...                                             ${signup_name1}

Test Scenario 4: Invalid Email
    [Tags]    NEGATIVE    EMAIL
    Given I landed in the website
    And I navigated to the SignUp form
    And I enter a username                          ${sample_username}
    And I enter an email                            samplegmail.com
    When I click the Signup button
    Then A required error message should display    ${missing_char}    
    ...                                             ${signup_email1}