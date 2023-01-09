*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource        ../resources/base.resource



#Test Teardown        Take Screenshot

*** Test Cases ***


Deve matricular um aluno

    # ${admin}    Get Fixture        admin
    # ${falcao}   Get Fixture        falcao

    # Reset Student           ${falcao}[student][email]

    # ${token}      Get Service Token    ${admin}
    # POST New Student      ${token}     ${falcao}[student]

    ${admin}                Get Fixtures  admin

    ${student}              Get Fixtures  student

    Reset Student Enroll    ${student}[email]

    Do Login                ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date   
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
