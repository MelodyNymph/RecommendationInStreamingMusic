#data1 = read.csv('samples1.csv')
#data1['new'] = floor(data1['new'])

#data1.mean = na.convert.mean(data1)

#data1.glm = glm(new ~ sex +age+ country, family=poisson, data=data1.mean)
#summary(data1.glm)

#data.try = data.frame(age=c(data1['age']), sex=c(data1['sex']),country=c(data1['country']))

#result = predict(data1.glm, newdata = data.try, type="response")
#write.csv(file = "result-samples1.csv", result)


#fit model
alluser_poisson = read.csv('alluser_poisson.csv')
alluser_poisson['plays'] = floor(alluser_poisson['plays'])
alluser_poisson.glm = glm(plays ~ newsex + newage+ country, family=poisson, data=alluser_poisson)

#predict
df_test_predict = read.csv('df_test_predict.csv')
df_test_predict.predict = data.frame(newage=c(df_test_predict['newage']), newsex=c(df_test_predict['newsex']),country=c(df_test_predict['country']))
predict_result = predict(alluser_poisson.glm, newdata = df_test_predict.predict, type="response")
write.csv(file = "predict_result_poisson.csv", predict_result)