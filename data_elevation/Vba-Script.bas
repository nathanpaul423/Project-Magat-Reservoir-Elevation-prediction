Attribute VB_Name = "Module2"
Sub AccessMultipleWorkbooks()
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim cellValue As Variant
    
    Set wbactive = ActiveWorkbook
    
    wbactive.Sheets.Add(Before:=Sheets(1)).Name = "Summary"
    Sheets("Summary").Cells(1, 1).Value = "Date"
    Sheets("Summary").Cells(1, 2).Value = "Year"
    Sheets("Summary").Cells(1, 3).Value = "Time"
    Sheets("Summary").Cells(1, 4).Value = "Elevation_m"
    Sheets("Summary").Cells(1, 5).Value = "Volume_mcm"
    Sheets("Summary").Cells(1, 6).Value = "Inflow_cms"
    Sheets("Summary").Cells(1, 7).Value = "Outflow_cms"
    Sheets("Summary").Cells(1, 8).Value = "AvgRainFall_mm"
    ' Define the folder path
    Dim folderPath As String
    folderPath = "C:\Users\NATHANPAULBUSTAMANTE\OneDrive\Documents\GitHub\Project-Magat-Reservoir-Elevation-prediction\workingFolder\"
    
    ' Get the list of Excel files in the folder
    Dim fileName As String
    fileName = Dir(folderPath & "*.xlsx")
    
    wbactive.Sheets("Summary").Select

    LR = wbactive.Sheets("Summary").Cells(Rows.Count, 2).End(xlUp).Row
    
    Columns("C:C").Select
    Selection.NumberFormat = "HH:mm"
    
    Do While fileName <> ""
    
        Set wb = Workbooks.Open(folderPath & fileName)
            On Error Resume Next ' Ignore error if worksheet doesn't exist
            Set wsToDelete = wb.Sheets("Summary")
            On Error GoTo 0
            
            ' Check if the worksheet exists and delete it
            If Not wsToDelete Is Nothing Then
            Application.DisplayAlerts = False ' Disable alert prompts
            wsToDelete.Delete
            Application.DisplayAlerts = False ' Disable alert prompts
            End If
            
        For Each ws In wb.Worksheets
                'insert loop for copying row values to summary table
                For j = 9 To 32
                    LR1 = wbactive.Sheets("Summary").Cells(Rows.Count, 2).End(xlUp).Row
                    
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 1).Value = ws.Name 'Date
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 2).Value = Mid(fileName, 4, 4)
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 3).Value = ws.Cells(j, 1).Value 'time
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 4).Value = ws.Cells(j, 2).Value 'elevation
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 5).Value = ws.Cells(j, 3).Value 'Volume
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 6).Value = ws.Cells(j, 4).Value 'inflow
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 7).Value = ws.Cells(j, 8).Value 'total outflow
                    wbactive.Sheets("Summary").Cells(LR1 + 1, 8).Value = ws.Cells(j, 32).Value 'avgrainfall
                Next j
            
        Next ws
    wb.Close SaveChanges:=False
    fileName = Dir
    Loop
    
    wbactive.Columns("C:C").Select
    Selection.NumberFormat = "[$-F400]h:mm:ss am/pm"

End Sub

