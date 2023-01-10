*** Settings ***
Documentation       Consumindo a rota students da API REST

Library             RequestsLibrary


*** Keywords ***

Post New Student
    [Arguments]     ${token}        ${student}

    ${headers}      Create Dicionary        Autorization=${token}


    ${admin}        Get Fixtures  admin

   ${response}      POST            http://localhost:3333/students
    ...             json=${student}
    ...             headers=${headers}
    ...             expected_status=201
