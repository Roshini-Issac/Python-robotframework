*** Settings ***

Library                 SeleniumLibrary

Library                 String

Library                 DateTime

Resource                ../Test_Data/Common_Test_Data.robot

Resource                ../Object_Repository/Common_Objects.robot

 

*** Keywords ***

Launch Application

    Open Browser    ${url}    ${browser}

    Maximize Browser Window

 

 

Create Dynamic Xpath

    [Arguments]    ${xpath}    ${value_SearchFor}    ${value_ReplaceWith}

    ${SELECTOR}    Replace String    ${xpath}    ${value_SearchFor}    ${value_ReplaceWith}

    RETURN    ${SELECTOR}

 

 

Capture Screenshot With Timestamp

    [Arguments]           ${screenshotName}

    ${timeStamp}          Create Date Timestamp

    ${screenshotName}     Catenate    ${screenshotName}    ${timeStamp}    

    Execute Javascript    document.body.style.zoom="75%"

    ${SCREENSHOT_IMG}=    Wait Until Keyword Succeeds    5    5s    Capture Page Screenshot     ${screenshotName}.png    

    Execute Javascript    document.body.style.zoom="100%"

    [Return]              ${SCREENSHOT_IMG}

 

Create Date Timestamp

   ${date} =    Get Current Date

   ${date1}=    Replace String   ${date}  ${SPACE}    ${EMPTY}

   ${date2}=    Replace String   ${date1}  -   ${EMPTY}

   ${date3}=    Replace String   ${date2}  :    ${EMPTY}

   ${date4}=    Replace String   ${date3}  .    ${EMPTY}

   [Return]    ${date4}

 

Close Browser And Delete Cookies, Screenshot On Failure

    Set Screenshot Directory    ./Screenshots

    Run Keyword If Test Failed     Capture Page Screenshot    ${BROWSER}_${SUITE NAME}_${TEST NAME}.png

    Delete All Cookies

    Sleep    ${minTime}

    Close All Browsers

 

Verify New Window launched for Print Preview

    Switch to New Window

 

Switch to New Window

    Switch Window    locator=NEW

   

Switch to Main Window

    Close Window

    Switch Window    locator=MAIN          