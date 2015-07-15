source("Survival_Plot.R")
source("Recurrence_Plot.R")
source("util.R")


# pdf(file= "All_Plots.pdf") #uncomment to export plot to pdf file
# # 
# # #Survival_Plot(file, time, status, gene) function prototype
# Recurrence_Plot("Finak_Breast_Detail.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L2 / A_24_P272917")
# 
# # dev.off() #uncomment to export plot to pdf file
# 
pdf(file= "TCGA_Breast_Plots.pdf") #uncomment to export plot to pdf file
# 
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L2 / 24573")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L2 / 24573")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17 / 5367")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17 / 5367")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L1P / 41468")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L1P / 41468")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L1P / 41469")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L1P / 41469")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L3 / 32031")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L3 / 32031")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L4 / 31767")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L4 / 31767")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L5 / 26727")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L5 / 26727")
# Recurrence_Plot("Taylor_Prostate_31.csv", "Recurrence Followup Time (Months)", "Recurrence Status", "USP17L7 / 33481")
# Survival_Plot("Taylor_Prostate_31.csv", "Overall Survival Followup Time (Months)", "Overall Survival Status", "USP17L7 / 33481")
Survival_Plot("TCGA_Breast.csv", "Overall Survival Followup Time (Days)", "Overall Survival Status", "USP17L7 / A_23_P252589")
#Survival_Plot("TCGA_Colorectal.csv", "Overall Survival Followup Time (Days)", "Overall Survival Status", "USP17L7 / A_23_P252589")


dev.off() #uncomment to export plot to pdf file