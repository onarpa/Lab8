*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To KKU
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://www.kku.ac.th
${EXPECTED_TITLE}    มหาวิทยาลัยขอนแก่น

*** Test Cases ***
Open KKU Website Title Should Be Correct
    [Documentation]    Verify KKU homepage title
    Title Should Be    ${EXPECTED_TITLE}

KKU Website Should Contain University Name
    [Documentation]    Verify page contains university name
    Page Should Contain    ขอนแก่น

KKU Website Should Load Successfully
    [Documentation]    Verify URL is correct after load
    Location Should Be    ${URL}

*** Keywords ***
Open Browser To KKU
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    Create Webdriver    Chrome    executable_path=/usr/bin/chromedriver    options=${options}
    Set Window Size    1920    1080
    Go To    ${URL}
