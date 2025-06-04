*** Settings ***
Documentation       Verify Registration functionality of Automation Exercise
Library             SeleniumLibrary
Library             BuiltIn
Resource           ../Resources/CreateUser/login_keywords.resource
Resource           ../Resources/CreateUser/Create_New_User_keywords.resource
Library            ../Resources/Custom keywords/utilities.py
Test Setup          Open The Browser With The Mortgage Payment Url
Test Teardown       Close Browser


*** Variables ***
${file_path}    ${CURDIR}${/}..${/}TestData${/}createuser.xlsx

*** Test Cases ***
Verify that new user is created
    ${data}=          Fetch Testdata By Id         ${file_path}        TC_101
    Enter Username        ${data}
    Enter Password        ${data}
    Click On Continue Button
    Verify User Can Redirect To Dashboard
    Click On Settings Icon
    Select 'Users' From DropDownList
    Verify User Can Redirect To User Page
    Click On +New User Button
    Verify User Can Redirect To New User Page
    Click On Select Store
    Select Assign Role
    Select 'Cashier' Option From Assign Role Drop Down
    Enter First Name        ${data}
    Enter Last Name         ${data}
    Enter Username As Email        ${data}
    Enter Email Id          ${data}
    Enter Phone Number        ${data}
    Re-Enter Password        ${data}
    Confirm Password By Re-Entering Password          ${data}
    Enter Employee Code        ${data}
    Scroll Down
    Enter Store Code        ${data}
    Verify Entered Store Code Exists         ${data}
    Click On Save Button
    ${username}=    Verify New User Is Generated
    Log    ${username}

    