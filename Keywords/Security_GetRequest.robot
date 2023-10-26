*** Settings ***

Library                 RequestsLibrary

Library    JSONLibrary

Library    Collections

Resource                ../Test_Data/Common_Test_Data.robot

Resource                ../Object_Repository/Common_Objects.robot

 

 

*** Keywords ***

Initiate a GET Request

    ${GetResponse}=    GET    ${url}

 

Get Student Details    

    # ${response}=    Get Request    Get_Details    api/studentsDetails --deprecated

    ${response}=    GET On Session    Get_Details    ${studentDetails}

    Set Global Variable    ${response}

 

Store Response as JSON for Data Validation    

    ${json_Response}=    Set Variable     ${response.json()}        

    Log    ${response.status_code}

    Log    ${response}

    Log    ${json_response}

   # @{first_Name_Response}=    Get Value From Json    ${json_response}    ${firstName}    

  #  ${fetch_Name_List}=    Get From List    ${first_Name_Response}    1        

  #  Should Be Equal As Strings    ${fetch_Name_List}    Joydeep

 

Fetch Student Details

    ${Student_Response}    GET On Session    Fetch_StudentData    ${uniqueStudentData}/${id}

    Log     ${Student_Response.status_code}

    Should Be Equal As Integers    ${Student_Response.status_code}    200

 

Get Request With Parameters

    ${response}=    GET  https://www.google.com/search  expected_status=200

 

Get A JSON Body

    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1

    Should Be Equal As Strings    1  ${response.json()}[id]

