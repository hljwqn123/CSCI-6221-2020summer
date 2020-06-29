source("plot_function.R")
#Descriptive statistics 
str(Attrition_data)
describe(Attrition_data)

#Visual exploration
#1. Basic identity information
plot_grid(p_Age, p_Education, p_MaritalStatus, p_Gender, p_NumCompaniesWorked, align = "h",ncol = 2)

#2. Employee company identity information
plot_grid(p_TotalWorkingYears, p_YearsAtCompany, p_JobRole, p_JobLevel, align = "h",ncol = 2)

#3. Salary and benefits information
#(1) Monthly salary, work input and performance score
plot_grid(p_MonthlyIncome, p_JobInvolvement, p_PerformanceRating, p_JobInvolvement_MonthlyIncome, align = "h",ncol = 2)

#(2)Welfare related variables
plot_grid(p_StockOptionLevel, p_PercentSalaryHike, p_TrainingTimesLastYear, p_YearsSinceLastPromotion, align = "h",ncol = 2)

#4. Quality of life related
#(1) Subjective satisfaction survey
plot_grid(p_EnvirnomentSatisfaction, p_JobSatisfication, p_RelationshipSatisfaction, p_WorkLifeBalance, align = "h",ncol = 2)

#(2) Objective work life conflict
plot_grid(p_DistanceFromHome, p_OverTime, p_BusinessTravel, align = "h",ncol = 2)

#Training model
#1. Decision tree model
rpart.plot(dtree, type = 4, tweak = 0.9, fallen.leaves = F, cex = 0.6)
prop.table(table(test$Attrition, preds, dnn = c("Actual", "Predicted")),1)
plot(rcov,print.auc=TRUE,auc.polygon=TRUE,grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE)
#After pruning
plot(rocvpr,print.auc=TRUE,auc.polygon=TRUE,grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE)

#2. Random Forest model
plot(rocrf,print.auc=TRUE,auc.polygon=TRUE,grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE)

#3. Optimized GBM model
plot(rocweight,print.auc=TRUE,auc.polygon=TRUE,grid=c(0.1,0.2),grid.col=c("green","red"),max.auc.polygon=TRUE,auc.polygon.col="skyblue",print.thres=TRUE)

# Model application
#1. Variable importance list
varImp(weightedfit)

#2. Prediction
jobinvolvement_prediction
department_prediction
