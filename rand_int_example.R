cdata <- ddply(data3, c("school"), summarise,
               N    = sum(!is.na(hi_math)),
               mean = mean(hi_math, na.rm=TRUE),
               sd   = sd(hi_math, na.rm=TRUE),
               se   = sd / sqrt(N))
