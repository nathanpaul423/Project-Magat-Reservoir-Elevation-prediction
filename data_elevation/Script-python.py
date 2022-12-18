import os
import win32com.client

text_file = "C:\\Users\\Tokwa\\Documents\\GitHub\\Project-1---Magat-Reservoir-Elevation-prediction\\data_elevation\\script.txt"

# Open the workbook
xl = win32com.client.Dispatch("Excel.Application")
# xl.Visible = True  # optional
wb = xl.Workbooks.Open(os.path.abspath(r"C:\Users\Tokwa\Documents\GitHub\Project-1---Magat-Reservoir-Elevation-prediction\data_elevation\VBA - Script.xlsm"))

# Add a new module
module = wb.VBProject.VBComponents.Add(1)  # 1 stands for a module

module.CodeModule.AddFromFile(text_file)

module.CodeModule.Execute()

# Save the workbook
wb.Save()

# Close the workbook
xl.Quit()