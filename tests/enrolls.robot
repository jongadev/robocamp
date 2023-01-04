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

    Do Login                ${user}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    Falcão Não mexer
    Select Plan       Smart
    Fill Start Date   11/11/2022
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
