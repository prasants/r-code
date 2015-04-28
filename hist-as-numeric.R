#Prasant Sudhakaran
#renaming columns in the undergrad data frame
names(undergrad) = c("timestamp", "excel", "access", "statistics", "programming", "iscourse", "cscourse", "topics", "istopics", "onlinecourse", "concentration")

excel_ordered = ordered(x=excel, levels=c("Strongly disagree", "Disagree", "Somewhat disagree", "Neither agree or disagree", "Somewhat agree", "Agree", "Strongly Agree"))
statistics_ordered = ordered(x=statistics, levels=c("Strongly disagree", "Disagree", "Somewhat disagree", "Neither agree or disagree", "Somewhat agree", "Agree", "Strongly Agree"))
programming_ordered = ordered(x=programming, levels=c("Strongly disagree", "Disagree", "Somewhat disagree", "Neither agree or disagree", "Somewhat agree", "Agree", "Strongly Agree"))
par(mfrow=c(1,3))
hist(as.numeric(excel_ordered, breaks=7), xlab="Excel", main="Responses for Excel")
hist(as.numeric(statistics_ordered, breaks=7), xlab="Statistics", main="Responses for Statistics")
hist(as.numeric(programming_ordered, breaks=7), xlab="Programming", main="Responses for Programming")