*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${start_page}         https://auth0.github.io/device-flow-playground/
${browser}            chrome

*** Keywords ***

Open Start Page
    open browser     ${start_page}  ${browser}
    maximize browser window

Finish TestCase
    close all browsers

Close Authenticate Page
    close browser
    sleep    10s

