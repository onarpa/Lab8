
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://computing.kku.ac.th

*** Test Cases ***
Open KKU Website
    Open Browser    ${URL}    ${BROWSER}    options=${CHROME OPTIONS}
    Title Should Be    computing
    Close Browser

*** Keywords ***
${CHROME OPTIONS}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    [Return]    ${options}
