*** Settings ***

Documentation       Tudo começa aqui

Resource            components/navbar.resource
Resource            components/toast.resource
Resource            pages/login.resource
Resource            pages/enroll.resource

*** Keywords ***

#Helpers

Do Login
    [Arguments]      ${user}

    Go To Login Page
    Fill Credencials            ${user}[email]     ${user}[pass]
    Submit Credencials
    User Should Be Looged In    ${user}[name]