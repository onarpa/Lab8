*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To KKU
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.kku.ac.th

*** Test Cases ***
Open KKU Website
    Title Should Be    มหาวิทยาลัยขอนแก่น


*** Keywords ***
Open Browser To KKU
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    Create Webdriver    Chrome    options=${options}
    Set Window Size    1920    1080
    Go To    ${URL}

