import os
import win32com.client

text_file = "C:\\Users\\Tokwa\\Documents\\GitHub\\Project-1---Magat-Reservoir-Elevation-prediction\\data_elevation\\script.txt"
parent_dir = r"C:\Users\Tokwa\Documents\GitHub\Project-1---Magat-Reservoir-Elevation-prediction"
# Open the workbook
xl = win32com.client.Dispatch("Excel.Application")
# xl.Visible = True  # optional

list = os.listdir(parent_dir)
list_workingFolder = os.path.join(parent_dir,list[6])
print(os.listdir(list_workingFolder))


# wb = xl.Workbooks.Open(os.path.abspath(r"C:\Users\Tokwa\Documents\GitHub\Project-1---Magat-Reservoir-Elevation-prediction\data_elevation\VBA - Script.xlsm"))
#
# # Add a new module
# module = wb.VBProject.VBComponents.Add(1)  # 1 stands for a module
# #
# module.CodeModule.AddFromFile(text_file)
#
# xl.Application.Run("Magat")
#
# # Save the workbook
# wb.Save()
#
# # Close the workbook
# xl.Quit()