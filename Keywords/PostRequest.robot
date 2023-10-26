*** Settings ***

Library                 RequestsLibrary

Library    JSONLibrary

Library    Collections

Resource                ../Test_Cases/TC03_POST call.robot

Resource                ../Test_Data/Common_Test_Data.robot

Resource                ../Object_Repository/Common_Objects.robot

 

 

*** Keywords ***

 

Add Student Details into the Database

    Create Session    AddData    ${appURL}

    &{body}=    Create Dictionary    first_name=Sampledata    middle_name=Post    last_name=API    date_of_birth=11/09/1967

    &{header}=    Create Directory    Content-Type=application/json

    ${response}=    POST On Session    AddData    /api/studentsDetails    data=${body}    headers=${header}

    Set Global Variable    ${response}

 

Store POST Response as JSON for Data Validation    

    ${json_Response}=    Set Variable     ${response.json()}        

    Log    ${response.status_code}

    Should Be Equal As Integers    ${response.status_code}    201

 

Get Student Details from the Database    

    ${Retrieve_Response}    GET On Session    Fetch_StudentData    ${uniqueStudentData}/${id}

    Log     ${Retrieve_Response.status_code}

    Should Be Equal As Integers    ${Retrieve_Response.status_code}    200

 

Store the Response Retrieved for Student Data as JSON  

    ${json_Student_Response}=    Set Variable     ${response.json()}        

    Log    ${response.status_code}

    Should Be Equal As Integers    ${response.status_code}    201

    Log    ${json_Student_Response}

#    @{id_Response}=     Get Value From Json    ${json_Student_Response}    ${id}

   # Should Be Equal As Integers    ${id_Response}    ${id}

 

Validate Invalid Student Details Retrieval from the Database    

     Create Session    AddData    ${appURL}

    &{body}=    Create Dictionary    first_name=Sampledata    middle_name=Post    last_name=API    date_of_birth=11/09/1967

    &{header}=    Create Directory    Content-Type=application/json

    ${response}=    POST On Session    AddData    /api/    data=${body}    headers=${header}

    Set Global Variable    ${response}

