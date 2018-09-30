
#if the original data does not have time info, below code can assign yr and freq. substract last few data for a datacomparison
lrp.ts <- ts(AirPassengers[1:100],start=c(1949,1),frequency=12)

#all data set
lrpall.ts <- ts(AirPassengers,start=c(1949,1),frequency=12)

#auto coefficiency functions
acf(lrp.ts)

#seasonal plot
seasonplot(lrp.ts,col=rainbow(12),season.labels=TRUE,year.labels=TRUE,
           year.labels.left=TRUE,cex=0.7)

#decombose to 3 factors; trend, seasonal, and random
plot(decompose(lrp.ts))

#fofecast model
model.lrp <- auto.arima(
  lrp.ts, #ts table
  ic="aic",
  trace=T, #show scenario assessed for aic
  stepwise=F, #do not sample
  approximation=F, #do not approximate
  start.p=0,
  start.q=0,
  start.P=0,
  start.Q=0
)

#show model result
model.lrp

#plot data with prediction
plot(
  forecast(model.lrp,level=c(50,95),h=48),
  shadecols=c("grey","blue"),
  fcol=1
)

lines(lrpall.ts)
