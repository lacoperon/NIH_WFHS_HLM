# Playing around with the data -- to try to understand what it looks like

library(plyr)

#Looking at various data in the WFHS set regarding job satisfaction

jsat <- wfhs[c("WM_JSAT1R","WM_JSAT2R","WM_JSAT3R")]
resToValue <- c("(1) STRONGLY DISAGREE"   = 1, 
                   "(2) DISAGREE"         = 2,
                   "(3) NEITHER"          = 3,
                   "(4) AGREE"            = 4,
                   "(5) STRONGLY AGREE"   = 5)

#Converts response codes to their integer equivalents
jsat$WM_JSAT1R <- as.numeric(revalue(jsat$WM_JSAT1R, resToValue))
jsat$WM_JSAT2R <- as.numeric(revalue(jsat$WM_JSAT2R, resToValue))
jsat$WM_JSAT3R <- as.numeric(revalue(jsat$WM_JSAT3R, resToValue))

#creates correlation matrix of the various measures
cormat <- round(cor(ewb),3)

library(reshape2)
library(ggplot2)
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
                 Control_Over_Hours = mean(SCWM_CWH, na.rm = TRUE),=
                 )
plot(summary)

# Should do a correlation matrix on variables that might be correlated
# -- to include correlated measures isn't a good thing. 

