*** Settings ***
Documentation   Gerenciando a massa de testes atravez do banco de dados

Library         DatabaseLibrary

*** Keywords ***

Connect To Postgres
    Connect To Database	    psycopg2
    ...                 	vojnqzxy
    ...                 	vojnqzxy
    ...                 	UaZETmNsGxT0r2jk9Tuo-nfqnDGNRvUh
    ...                 	babar.db.elephantsql.com
    ...                 	5432

Select Student Where Email
    [Arguments]     ${email}
    ${query}        Set Variable
    ...             Select * FROM public.students WHERE email= '${email}';

   ${result}        Query       ${query}

    [Return]      ${result}[0]

Delete Enroll By Email
    [Arguments]     ${email}

    ${user}         Select Student Where Email  ${email}

    ${query}        Set Variable
    ...             DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

   Execute SQL String       ${query}

#helpers

Reset Student Enroll
    [Arguments]         ${email}   

    Connect To Postgres
    Delete Enroll By Email  ${email}
    Disconnect From Database
