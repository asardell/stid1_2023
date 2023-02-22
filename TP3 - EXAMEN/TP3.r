#1.a
df<-read.csv("fao.csv", sep=";", dec=",", header = T)
#1.b
nrow(df)
#1.c
summary(df)

#2.a
mean(df$Dispo_alim, na.rm=T)

#2.b
sum(df$Population, na.rm=T)
#2.c
sd(df$Export_viande, na.rm=T)
sd(df$Import_viande, na.rm=T)

#2.d
median(df$Prod_viande, na.rm=T)

#2.e
quantile(df$Dispo_alim)

#2.f
quantile(df$Import_viande, seq(0,1,0.01))

#3.1
q3.1<-head(df[order(df$Population),],5)

#3.2
q3.2<-head(df[order(df$Population, decreasing = T),])
#3.3
q3.3<-df[df$Dispo_alim>=2300,]
nrow(q3.3)

#3.4
q3.4<-df[df$Dispo_alim>3500  & df$Import_viande>1000,]
nrow(q3.4)

#3.5
q3.5<-df[  (df$Nom=="France")  | (df$Nom=="Belgique"),]
#ou
q3.5<-df[ df$Nom %in% c("France","Belgique") , ]
nrow(q3.5)

#4.1
df$Part_export<-df$Export_viande/df$Prod_viande

#4.2
df$Dispo_alim_pays<-df$Dispo_alim*df$Population
#4.3
dispo_alim_mondiale<-sum(df$Dispo_alim_pays, na.rm=T)
#4.4
dispo_alim_mondiale/2300
