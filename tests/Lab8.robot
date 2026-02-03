*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open KKU Website
    Open Browser    https://computing.kku.ac.th    chrome
    Title Should Be    Khon Kaen University
    Close Browser
