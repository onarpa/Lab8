*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://computing.kku.ac.th
${BROWSER}    Chromium

*** Test Cases ***
Open KKU Website
    Open Browser    ${URL}    ${BROWSER}    options=${CHROME_OPTIONS}
    Title Should Be    Khon Kaen University
    Close Browser

*** Keywords ***
Get Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920,1080
    RETURN    ${options}

*** Variables ***
${CHROME_OPTIONS}    Get Chrome Options
