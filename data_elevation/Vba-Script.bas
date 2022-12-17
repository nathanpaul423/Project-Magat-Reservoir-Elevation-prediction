Attribute VB_Name = "Module1"
Sub Magat()

Dim LR As Integer
Dim LR1 As Integer
Dim ws As Worksheet
Dim x As Integer
Dim i As Integer
    
    Sheets.Add(Before:=Sheets(1)).Name = "Summary"
    Sheets("Summary").Select
    
    Sheets("Summary").Cells(1, 2).Value = "TimeLine_date"
    Sheets("Summary").Cells(1, 3).Value = "TimeLine_time"
    Sheets("Summary").Cells(1, 4).Value = "Elevation"
    Sheets("Summary").Cells(1, 5).Value = "Inflow"
    Sheets("Summary").Cells(1, 6).Value = "Outflow"
    Sheets("Summary").Cells(1, 7).Value = "AvgRainFall"
    


    LR = Cells(Rows.Count, 1).End(xlUp).Row

    'For i = 9 To 32
    'Worksheets("Summary").Cells(i, 2).Value = Worksheets
    'Next i

    x = 1
    'Ensures range is in the right format
    Sheets("Summary").Range("A:A").NumberFormat = "@"

    'listing name of worksheets
    For Each ws In Worksheets
        Sheets("Summary").Cells(x, 1).Value = ws.Name
        Sheets("Summary").Cells(x, 1).NumberFormat = "@"
        x = x + 1
    Next ws

    i = 0

    Sheets("Summary").Select

    LR = Cells(Rows.Count, 1).End(xlUp).Row

    For i = 2 To LR
        t = Sheets("Summary").Cells(i, 1).Value
        'insert loop for copying row values to summary table
        For j = 9 To 32
            LR1 = Sheets("Summary").Cells(Rows.Count, 2).End(xlUp).Row
            
            Sheets("Summary").Cells(LR1 + 1, 2).Value = t 'Date
            Sheets("Summary").Cells(LR1 + 1, 3).Value = Sheets(t).Cells(j, 1).Value 'time

            Sheets("Summary").Cells(LR1 + 1, 4).Value = Sheets(t).Cells(j, 2).Value 'elevation
            Sheets("Summary").Cells(LR1 + 1, 5).Value = Sheets(t).Cells(j, 4).Value 'inflow
            Sheets("Summary").Cells(LR1 + 1, 6).Value = Sheets(t).Cells(j, 8).Value 'total outflow
            Sheets("Summary").Cells(LR1 + 1, 7).Value = Sheets(t).Cells(j, 33).Value 'avgrainfall
            
        Next j
        
    Next i
    
    Columns("C:C").Select
    Selection.NumberFormat = "[$-F400]h:mm:ss am/pm"
    
    Sheets("Summary").Select
    Sheets("Summary").Range("A:A").Delete
    
    
End Sub



