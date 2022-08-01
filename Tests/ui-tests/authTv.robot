*** Settings ***
Documentation     TV Code Authentication
Library    SeleniumLibrary

Resource    ../../Resources/CommonFunctionality.robot
Resource    ../../Resources/auth_UserDefinedKeywords.robot

Test Setup      Open Start Page
Test Teardown   Finish TestCase

*** Variables ***


*** Test Cases ***

Device Code Verification

    [Documentation]    Verifies the device code for TV with UI
    [Tags]    Functional

    Verify Start Page
    Open Authorization Page
    Verify Authorization Page
    Authenticate Token
    Verify Final Page

*** Keywords ***
