*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${start_button}     xpath = //div[@id="start-btn"]
${authorize_button}     xpath = //div[@id="authorize-btn"]
${tenant_inp}       //*[@id="tenant-input"]
${client_id}        //*[@id="client-id-input"]
${audience}         //*[@id="audience-input"]
${auth_button}      xpath = //div[@id="authorize-btn"]
${auth_code}        id=user-code
${user_name}        //*[@id="username"]
${password}         //*[@id="password"]
${activation_url}    https://acme-demo.auth0.com/activate
${browser}          chrome
${code_input}       //*[@id="code"]
${continue_button}    xpath = /html/body/div/main/section/div/div/div/form/div[2]/button
${confirm_page2}    xpath = /html/body/div/main/section/div/div/div/form/div[2]/button[1]
${login_button}     xpath= /html/body/div/main/section/div/div/div/form/div[2]/button
${cancel_button}    /html/body/div/main/section/div/div/div/form/div[2]/button[2]

*** Keywords ***
Verify Start Page
    page should contain element     ${start_button}
    page should contain textfield    ${tenant_inp}
    page should contain textfield    ${client_id}
    page should contain textfield    ${audience}
    textfield should contain    ${tenant_inp}         acme-demo.auth0.com
    textfield should contain    ${client_id}      nZ8JDrV8Hklf3JumewRl2ke3ovPZn5Ho
    textfield should contain    ${audience}       urn:my-videos

Open Authorization Page
    click element    ${start_button}


Verify Authorization Page
    page should contain element     ${auth_button}
    page should contain    Authorization Request

Authenticate Token
    click element    ${auth_button}
    sleep       2s
    page should contain     Token Request
    ${code}=         get webelement       ${auth_code}
    open browser     ${activation_url}    ${browser}
    maximize browser window
    page should contain textfield    ${code_input}
    page should contain     Device Activation
    page should contain element     ${continue_button}
    input text       ${code_input}        ${code.text}
    click element    ${continue_button}
    page should contain     Device Confirmation
    page should contain element     ${confirm_page2}
    click element    ${confirm_page2}
    input text       ${user_name}          testnetsiden@gmail.com
    input password   ${password}           AppleTv#22
    click element    ${login_button}
    page should contain    Congratulations
