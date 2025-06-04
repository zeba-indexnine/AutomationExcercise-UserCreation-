*** Settings ***
Library            SeleniumLibrary
Library            BuiltIn
Library            Collections
Library            String
Library            ../../Resources/Custom keywords/utilities.py
Variables         ../../PageObjects/Create_New_User.py
Variables         ../../Environment/env.py

*** Keywords ***
Click On Settings Icon
    Wait Until Element Is Visible        ${setting_icon}
    Mouse Over                           ${setting_icon}
Select 'Users' From DropDownList
    Wait Until Element Is Visible        ${user_text}
    Click Element                        ${user_text}

Verify User Can Redirect To User Page
    Wait Until Element Is Visible        ${user_page}

Click On +New User Button
    Wait Until Element Is Visible        ${new_user_btn}
    Click Element                        ${new_user_btn}

Verify User Can Redirect To New User Page
    Wait Until Element Is Visible        ${new_user_page}

Click On Select Store
    Wait Until Element Is Visible        ${select_store_check_btn}        timeout=10s
    Click Element                        ${select_store_check_btn}

Select Assign Role
    Wait Until Element Is Visible        ${assign_role_drop_down}        timeout=10s
    Click Element                        ${assign_role_drop_down}

Select 'Cashier' Option From Assign Role Drop Down
    Wait Until Element Is Visible        ${cashier_option}        timeout=10s
    Click Element                        ${cashier_option}

Enter First Name
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${first_name_text_box}        timeout=10s
    Click Element                        ${first_name_text_box}
    Input Text                           ${first_name_text_box}           ${my_dict.FirstName}

Enter Last Name
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${last_name_text_box}        timeout=10s
    Click Element                        ${last_name_text_box}
    Input Text                           ${last_name_text_box}           ${my_dict.LastName}

Enter Username As Email
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${username}        timeout=10s
    Click Element                        ${username}
    Input Text                           ${username}           ${my_dict.Email}

Enter Email Id
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${email_id_text_box}        timeout=10s
    Click Element                        ${email_id_text_box}
    Input Text                           ${email_id_text_box}           ${my_dict.Email}

Enter Phone Number
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${phone_no_text_box}        timeout=10s
    Click Element                        ${phone_no_text_box}
    Input Text                           ${phone_no_text_box}           ${my_dict.Phone}

Re-Enter Password
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${pass_text}        timeout=10s
    Click Element                        ${pass_text}
    Input Text                           ${pass_text}           ${my_dict.Pass}

Confirm Password By Re-Entering Password
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${confirm_pass_text_box}        timeout=10s
    Click Element                        ${confirm_pass_text_box}
    Input Text                           ${confirm_pass_text_box}           ${my_dict.Pass}

Enter Employee Code
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Wait Until Element Is Visible        ${employee_code_text_box}        timeout=10s
    Click Element                        ${employee_code_text_box}
    Input Text                           ${employee_code_text_box}           ${my_dict.Code}

Scroll Down
    Execute JavaScript    window.scrollBy(0,500)
    Wait Until Element Is Visible    ${store_search_box}        timeout=10s

Enter Store Code
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    Click Element    ${store_search_box}
    Input Text                           ${store_search_box}           ${my_dict.Store_code}

Verify Entered Store Code Exists
    [Arguments]        ${my_data}
    ${my_dict}=        Create Dictionary        &{my_data}
    ${code_text}=    Replace String    ${selected_store_code}      Swap        ${my_dict.Store_code}
    #Wait Until Element Is Visible    ${code_text}    timeout=10s
    Sleep    2s
    Click Element         ${check_box}

Click On Save Button
    Sleep     2s
    Scroll Element Into View        ${new_user_page}
    Wait Until Element Is Visible        ${save_btn}        timeout=10s
    Click Element                        ${save_btn}

Verify New User Is Generated
    Sleep    2s
    Wait Until Element Is Visible        ${user_text_page}        timeout=10s
    Sleep    5s
    ${generated_username}        Get Text        ${verify_username}
    RETURN    ${generated_username}


