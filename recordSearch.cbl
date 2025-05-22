       IDENTIFICATION DIVISION.
       PROGRAM-ID. recordSearch.
       AUTHOR. Nathan Kernan.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "employees.txt".

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-REC.
           05 EMP-ID   PIC X(5).
           05 EMP-NAME PIC X(20).

       WORKING-STORAGE SECTION.
       01 SEARCH-NAME  PIC X(20).
       01 FOUND-FLAG   PIC X VALUE "N".
       01 EOF          PIC X VALUE "N".

       PROCEDURE DIVISION.
           DISPLAY "Enter employee name to search: "
           ACCEPT SEARCH-NAME

           OPEN INPUT EMP-FILE
           PERFORM UNTIL EOF = "Y"
               READ EMP-FILE AT END
                   MOVE "Y" TO EOF
               NOT AT END
                   IF FUNCTION TRIM(EMP-NAME) =
      -                FUNCTION TRIM(SEARCH-NAME)
                       DISPLAY "Found: " EMP-ID " " EMP-NAME
                       MOVE "Y" TO FOUND-FLAG
                   END-IF
               END-READ
           END-PERFORM
           IF FOUND-FLAG = "N"
               DISPLAY "Employee not found."
           END-IF
           CLOSE EMP-FILE

           STOP RUN.

       END PROGRAM recordSearch.
