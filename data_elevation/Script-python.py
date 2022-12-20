import os
import win32com.client
import openpyxl

#directories
text_file = "C:\\Users\\Tokwa\\Documents\\GitHub\\Project-1---Magat-Reservoir-Elevation-prediction\\data_elevation\\script.txt"
parent_dir = r"C:\Users\Tokwa\Documents\GitHub\Project-1---Magat-Reservoir-Elevation-prediction\\workingFolder"


list = os.listdir(parent_dir)
file_list=[]
for i in list:
    file_list.append(os.path.join(parent_dir,i))

list_xlsm=[]
for i in list:
    list_xlsm.append(i.replace('.xlsx','.xlsm'))

#converts .xlsx to .xlsm
for i,j in zip(file_list,list_xlsm):
    wb = openpyxl.load_workbook(i)
    wb.save(os.path.join(parent_dir,j))


# write VBA script.
# Open the workbook
xl = win32com.client.Dispatch("Excel.Application")
# xl.Visible = True  # optional
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