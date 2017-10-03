#Extracting the data-------------------------------------

query<-"SELECT playerID,sum(HR) AS career_HR,sum(SO) AS career_SO
FROM Batting
GROUP BY playerID
HAVING sum(HR)>=400"

result<-sqldf(query)

# viwualizing the data-------------------------------------

ggplot()+
  geom_point(data=result,aes(x=career_SO,y=career_HR),size=3,color="pink")+
  ggtitle("Career Strikeouts Vs Homeruns for Great Hitters")+
  xlab("Career Strike Outs")+ylab("Career Home Runs") 

## Histograms
# Extracting the data---------------------------------------

query<-"SELECT weight
FROM Master"

result<-sqldf(query)

# visualize the data---------------------------------------------------

ggplot()+
  geom_histogram(data=result,aes(x=weight),color="pink",fill="white",bins=40)+
  ggtitle("Baseball Player Body-Weight Distribution")

## Line Graph
# Extracting the Data-------------------------------------------------

query<-"SELECT yearID,HR
FROM Batting
WHERE playerID='ruthba01'"

result<-sqldf(query)

# Visualizing the Data---------------------------------------------------

ggplot()+
  geom_line(data=result,aes(x=yearID,y=HR))+
  geom_point(data=result,aes(x=yearID,y=HR))+
  ggtitle("Ruth's Homerun Totals Through the Years")+
  xlab("Year")+
  ylab("Home Runs")