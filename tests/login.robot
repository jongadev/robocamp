*** Settings ***
Documentation       Suite de testes de autenticação
...                 Administrador deve acessar o portal de gestão de academias

Resource            ../resources/base.resource


*** Test Cases ***

Login do Administrador
    Go To Login Page
    
    Fill Credencials             admin@smartbit.com     qacademy
    #Click                       text=Entrar no sistema
    Submit Credencials
    User Should Be Looged In     Admin
    
Email não cadastrado
    
    Go To Login Page

    
   Fill Credencials             404@smartbit.com        qacademy
      
    #Click                       text=Entrar no sistema
    Submit Credencials

   Verify Toaster               Suas credenciais são inválidas, por favor tente novamente!

    Sleep                        5


Senha inválida
   # [Tags]                     temp
    
    Go To Login Page
    
    Fill Credencials           admin@smartbit.com  qacademo       
       
    #Click                       text=Entrar no sistema
    Submit Credencials  

    Verify Toaster              Suas credenciais são inválidas, por favor tente novamente!

    Sleep                        5


Email no formato incorreto 
    

    Go To Login Page
    Fill Credencials            @smartbit.com  qacademo
    Submit Credencials
    Field Type Should Be Email

Senha em branco
    
    Go To Login Page
    Fill Credencials            admin@smartbit.com   ${EMPTY}
    Submit Credencials
    Alert Text Should Be        password  A senha é obrigatória

Email em branco
    #[Tags]                      temp
    Go To Login Page
    Fill Credencials            ${EMPTY}    qacademy
    Submit Credencials
    Alert Text Should Be        email     O e-mail é obrigatório

Email e senha são obrigatorios
    [Tags]                      temp

    Go To Login Page
    Submit Credencials
    Alert Text Should Be        email     O e-mail é obrigatório
    Alert Text Should Be        password  A senha é obrigatória