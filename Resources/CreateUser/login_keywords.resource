*** Settings ***
Library            SeleniumLibrary
Library            BuiltIn
Library            Collections
Library            String
Library            ../../Resources/Custom keywords/utilities.py
Variables         ../../PageObjects/login.py
Variables         ../../Environment/env.py

*** Keywords ***
Open The Browser With The Mortgage Payment Url
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Enter Username
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${username_text_box}
    Click Element                        ${username_text_box}
    Input Text                           ${username_text_box}           ${my_dict.Username}

Enter Password
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${password_text_box}
    Click Element                        ${password_text_box}
    Input Text                           ${password_text_box}           ${my_dict.Password}

Click On Continue Button
    Wait Until Element Is Visible        ${continue_btn}
    Click Element                        ${continue_btn}

Verify User Can Redirect To Dashboard
    Wait Until Element Is Visible        ${dashboard_page}

