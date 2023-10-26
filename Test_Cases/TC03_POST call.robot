*** Settings ***

Resource                ../Keywords/Common_Keywords.robot

Resource                ../Keywords/GetRequest.robot

Resource                ../Keywords/PostRequest.robot

Library                 RequestsLibrary

Library                 JSONLibrary

Library                 Collections

Library                OperatingSystem

#Test Teardown           Close Browser and Delete Cookies, Screenshot on Failure

 

*** Test Cases ***

POST API Validations    

    Add Student Details into the Database

    Store POST Response as JSON for Data Validation

    Create Session    Fetch_StudentData    ${appURL}

    Get Student Details from the Database

    Store the Response Retrieved for Student Data as JSON

    Validate Invalid Student Details Retrieval from the Database    