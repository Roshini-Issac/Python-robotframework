*** Settings ***

Resource                ../Keywords/Common_Keywords.robot

Resource                ../Keywords/GetRequest.robot

#Test Setup              Launch Application

Library                 RequestsLibrary

Library                 JSONLibrary

Library                 Collections

#Test Teardown           Close Browser and Delete Cookies, Screenshot on Failure

 

*** Test Cases ***

Fetch and Validate Student Details

    Create Session    Fetch_StudentData    ${appURL}

    Get Student Details    

   