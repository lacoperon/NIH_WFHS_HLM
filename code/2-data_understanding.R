# Playing around with the data -- to try to understand what it looks like

library(plyr)
library(dplyr)
library(reshape2)
library(ggplot2)

  
# Recall that response variable is EM_DIST1
# Recall that contributing variables are 
# Level 1: WM_WFC2, WM_CWH1
# Level 2: WM_OCLI1,WM_OCLI2, WM_SICK
# ---- Response Variable ----

# Initial Plotting of the Response Variable, EM_DIST1,
# which measures how often employees feel so sad that nothing can cheer them up

ds <- wfhs[c("EM_DIST1R","WGID")]
resToValueEM <- c("(1) NONE OF THE TIME"     = 1,
                  "(2) A LITTLE OF THE TIME" = 2,
                  "(3) SOME OF THE TIME"     = 3,
                  "(4) MOST OF THE TIME"     = 4,
                  "(5) ALL OF THE TIME"      = 5)

ds$EM_DIST1R <- as.numeric(revalue(ds$EM_DIST1R, resToValueEM))

#Gets count of each value within EM_DIST1
emdist1_counts <- table(ds$EM_DIST1R)
plot(emdist1_counts)

#Strongly skewed right, which is to be expected
# (you wouldn't expect most employees to be depressed, let alone reporting it)

# Grouping by workgroup -- trying to see the average scores for each workgroup

mean <- aggregate(ds["EM_DIST1R"], list(ds$WGID), mean)
qplot(mean$EM_DIST1R, xlim=c(1,5), 
      xlab = "Average Emotional Distress of Workgroup",
      ylab = "Number of workgroups in each bin",
      binwidth=0.05)
# ---- Level 1 Variables ----
# WM_WFC2 : Difficulty of Familial Responsibilities

# WM_CWH1 : Choice of vacation time
# ---- Level 2 Variables ----

# ---- Sidetrack : JSAT HeatMap ----
#Looking at various data in the WFHS set regarding job satisfaction

jsat <- wfhs[c("WM_JSAT1R","WM_JSAT2R","WM_JSAT3R")]
resToValueJSAT <- c("(1) STRONGLY DISAGREE"   = 1, 
                    "(2) DISAGREE"         = 2,
                    "(3) NEITHER"          = 3,
                    "(4) AGREE"            = 4,
                    "(5) STRONGLY AGREE"   = 5)

#Converts response codes to their integer equivalents
jsat$WM_JSAT1R <- as.numeric(revalue(jsat$WM_JSAT1R, resToValueJSAT))
jsat$WM_JSAT2R <- as.numeric(revalue(jsat$WM_JSAT2R, resToValueJSAT))
jsat$WM_JSAT3R <- as.numeric(revalue(jsat$WM_JSAT3R, resToValueJSAT))

#creates correlation matrix of the various measures
cormat <- round(cor(ewb),3)

#'melts' the correlation matrix for ggplot2
melted_cormat <- melt(cormat) 

# Plots Correlation Matrix
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() + 
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1,1),
                       space = "Lab", name="Pearson\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()








summary <- summarize(wfhs, WGID)
summary <- ddply(wfhs, "WGID", summarize, 
                 Control_Over_Hours = mean(SCWM_CWH, na.rm = TRUE),
                 )
plot(summary)

# Should do a correlation matrix on variables that might be correlated
# -- to include correlated measures isn't a good thing. 

