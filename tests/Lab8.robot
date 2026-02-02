*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080
    Call Method    ${chrome_options}    add_argument    --remote-debugging-port=9222

    Call Method    ${chrome_options}    binary_location    /usr/bin/google-chrome
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th