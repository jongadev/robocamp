*** Settings ***

Documentation       Tudo começa aqui

Resource            components/navbar.resource
Resource            components/toast.resource
Resource            pages/login.resource
Resource            pages/enroll.resource
Resource            database.resource

Resource            services/sessions.resource
Resource            services/students.resource

Library             JSONLibrary

*** Keywords ***

#Helpers

Do Login
    [Arguments]      ${user}

    Go To Login Page
    Fill Credencials            ${user}[email]     ${user}[password]
    Submit Credencials
    User Should Be Looged In    ${user}[name]

Get Fixtures  
    [Arguments]     ${fixture_file}

    ${fixture}              Load Json From File
    ...                     ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...                     encoding=UTF-8

    [Return]                ${fixture}
