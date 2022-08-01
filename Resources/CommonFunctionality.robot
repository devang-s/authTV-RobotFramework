*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${start_page}         https://auth0.github.io/device-flow-playground/
${browser}            chrome

*** Keywords ***

Open Start Page
    open browser     ${start_page}  ${browser}    alias=start_page
    maximize browser window

Finish TestCase
    close all browsers


