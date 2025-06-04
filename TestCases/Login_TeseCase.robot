*** Settings ***
Documentation       Verify Registration functionality of Automation Exercise
Library             SeleniumLibrary
Library             BuiltIn
Resource           ../Resources/CreateUser/login_keywords.resource
Library            ../Resources/Custom keywords/utilities.py
Test Setup          Open The Browser With The Mortgage Payment Url
Test Teardown       Close Browser


*** Variables ***
${file_path}    ${CURDIR}${/}..${/}TestData${/}createuser.xlsx

*** Test Cases ***
Verify user can login with valid credentials
    ${data}=          Fetch Testdata By Id         ${file_path}        TC_101
    Enter Username        ${data}
    Enter Password        ${data}
    Click On Continue Button
    Verify User Can Redirect To Dashboard


