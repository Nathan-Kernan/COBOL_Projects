       IDENTIFICATION DIVISION.
       PROGRAM-ID. bubbleSort.
       AUTHOR. Nathan Kernan.
      ***********************************************
      * This program demonstrates table handling,   *
      * loops, and sorting logic.                   *
      ***********************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NUM-COUNT        PIC 9(2) VALUE 5.
       01  I                PIC 9(2).
       01  J                PIC 9(2).
       01  TEMP             PIC 9(4).
       01  NUM-ITEM         PIC 9(4) OCCURS 5 TIMES.

       PROCEDURE DIVISION.
           DISPLAY "Enter 5 numbers: ".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-COUNT
               ACCEPT NUM-ITEM(I)
           END-PERFORM.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-COUNT - 1
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > NUM-COUNT - I
                   IF NUM-ITEM(J) > NUM-ITEM(J + 1)
                       MOVE NUM-ITEM(J) TO TEMP
                       MOVE NUM-ITEM(J + 1) TO NUM-ITEM(J)
                       MOVE TEMP TO NUM-ITEM(J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM.

           DISPLAY "Sorted numbers: ".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-COUNT
               DISPLAY NUM-ITEM(I)
           END-PERFORM.

           STOP RUN.

       END PROGRAM bubbleSort.
       