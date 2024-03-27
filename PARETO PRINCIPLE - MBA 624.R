#MBA624-Week 2 Pareto principle using R
# Introducing a for Loop and sink() for output

# Created 3/20/2024

#Clear out my environment
rm(list=ls())

# Define Data & Output location
d_path <- "/Documents/MBA 624 - Spring 2024/CH02-BicycleInventorytxt.csv"
o_path <- "/Documents/MBA 624 - Spring 2024/CH02-BicycleInventorytxt.csv/Processed"


#Process Data

setwd(d_path)
df <- read.csv("CH02-BicycleInventorytxt.csv", stringsAsFactors = FALSE, skip=0, header = TRUE)

#inspect the data

View(df)

#Calculate required values

df$InvValue <- df$Quantity.on.Hand * df$Purchase.Cost
vInvTotal   <- sum(df$InvValue, na.rm = TRUE)

#Sort in descending order
df = df[order(-df$InvValue),]

# Calculate Cummulative

for (i in 1:nrow(df)) {
  if (i==1){
    df$CumPerc[i]=df$InvPerc[i]
  } else{
    df$CumPer[i] = df$InvPerc[i] + df$CumPerc[i-1]  
  }
}

#Output to text file, which can be formatted
setwd(o_path)
sink("CH02-BicycleOutput.txt")
print(df,row.names = FALSE)
sink()
