*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To KKU
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://www.kku.ac.th
${BROWSER}    chrome

*** Test Cases ***
Open KKU Website
    Title Should Be    มหาวิทยาลัยขอนแก่น

*** Keywords ***
Open Browser To KKU
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument(--headless)
    ...    add_argument(--no-sandbox)
    ...    add_argument(--disable-dev-shm-usage)
    ...    add_argument(--disable-gpu)
    ...    add_argument(--window-size=1920,1080)
    Maximize Browser Window
