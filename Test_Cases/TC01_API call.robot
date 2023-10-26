*** Settings ***

Resource                ../Keywords/Common_Keywords.robot

Resource                ../Keywords/GetRequest.robot

#Test Setup              Launch Application

Library                 RequestsLibrary

Library                 JSONLibrary

Library                 Collections

#Test Teardown           Close Browser and Delete Cookies, Screenshot on Failure

 

*** Test Cases ***

 

Getting Started with API

    Create Session    Get_Details    ${appURL}

    Get Student Details

    Store GET Response as JSON for Data Validation

 