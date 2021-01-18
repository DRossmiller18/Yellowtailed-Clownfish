library(hierfstat)
library(tidyverse)

sum_stats_mac2 <- readRDS("sum_stats_mac2.RDS")

################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosity for Japan population
J_Ho <- Ho[,1]
J_Ho_df <- data.frame(J_Ho)
J_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

He <- sum_stats_mac2$Hs #Observed heterozygosity for Japan population
J_He <- He[,1]
J_He_df <- data.frame(J_He)
J_He_df <- data.frame(sum_stats_mac2$Hs[,1])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Japan population
J_Fis <- Fis[,1]
J_Fis_df <- data.frame(J_Fis)
J_Fis_df <- data.frame(sum_stats_mac2$Fis[,1])

mean_Ho_J <- mean(J_Ho)
mean_Ho_J
mean_He_J <- mean(J_He)
mean_He_J

#removing NAs in Fis so you can calculate the mean --> make sure to do this for Philippines and Indonesia as well
J_Fis_df <- data.frame(J_Fis)
nona_JFis <- J_Fis_df[!is.na(J_Fis), ]

mean_Fis_J <- mean(nona_JFis)
mean_Fis_J

#Japan = 1, Philippines = 3, Indonesia = 2
################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosity for Philippines population
P_Ho <- Ho[,3]
P_Ho_df <- data.frame(P_Ho)
P_Ho_df <- data.frame(sum_stats_mac2$Ho[,3])

He <- sum_stats_mac2$Hs #Observed Heterozygosity for Philippines population
P_He <- He[,3]
P_He_df <- data.frame(P_He)
P_He_df <- data.frame(sum_stats_mac2$He[,3])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Philippines population
P_Fis <- Fis[,3]
P_Fis_df <- data.frame(P_Fis)
P_Fis_df <- data.frame(sum_stats_mac2$Fis[,3])

mean_Ho_P <- mean(P_Ho)
mean_Ho_P

mean_He_P <- mean(P_He)
mean_He_P

mean_Fis_P <- mean(P_Fis)
mean_Fis_P

P_Fis_df <- data.frame(P_Fis)
nona_PFis <- P_Fis_df[!is.na(P_Fis), ]

mean_Fis_P <- mean(nona_PFis)
mean_Fis_P

################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosity for Indonesia population
I_Ho <- Ho[,2]
I_Ho_df <- data.frame(I_Ho)
I_Ho_df <- data.frame(sum_stats_mac2$Ho[,2])

He <- sum_stats_mac2$Hs #Observed heterozygosity for Indonesia population
I_He <- He[,2]
I_He_df <- data.frame(I_He)
I_He_df <- data.frame(sum_stats_mac2$Hs[,2])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Indonesia population
I_Fis <- Fis[,2]
I_Fis_df <- data.frame(I_Fis)
I_Fis_df <- data.frame(sum_stats_mac2$Fis[,2])

mean_Ho_I <- mean(I_Ho)
mean_Ho_I

mean_He_I <- mean(I_He)
mean_He_I

mean_Fis_I <- mean(I_Fis)
mean_Fis_I

I_Fis_df <- data.frame(I_Fis)
nona_IFis <- I_Fis_df[!is.na(I_Fis), ]

mean_Fis_I <- mean(nona_IFis)
mean_Fis_I

################################################################################

write.csv(Ho, "Ho.csv")
write.csv(He, "He.csv")
write.csv(Fis, "Fis.csv")

GeneticDiversity <- cbind(Ho, He, Fis)
write.csv(GeneticDiversity, "GeneticDiversity.csv")

################################################################################

################################################################################

#Standard Error
nona_JFis <- Fis[is.na(Fis$Japan), 2]
J_Fis_mean <- mean(nona_JFis)
J_Fis_ste <- std.error(nona_JFis)
J_Fis <- cbind(J_Fis_mean, J_Fis_ste)

J_Ho_mean <- mean(Ho$Japan)
J_Ho_ste <- std.error(Ho$Japan)
J_Ho <- cbind(J_Ho_mean, J_Ho_ste)

J_He_mean <- mean(He$Japan)
J_He_ste <- std.error(He$Japan)
J_He <- cbind(J_He_mean, J_He_ste)

J_div_sum <- cbind(J_Fis, J_Ho, J_He)

################################################################################

nona_PFis <- Fis[is.na(Fis$Philippines), 2]
P_Fis_mean <- mean(nona_PFis)
P_Fis_ste <- std.error(nona_PFis)
P_Fis <- cbind(P_Fis_mean, P_Fis_ste)

P_Ho_mean <- mean(Ho$Philippines)
P_Ho_ste <- std.error(Ho$Philippines)
P_Ho <- cbind(P_Ho_mean, P_Ho_ste)

P_He_mean <- mean(He$Philippines)
P_He_ste <- std.error(He$Philippines)
P_He <- cbind(P_He_mean, P_He_ste)

P_div_sum <- cbind(P_Fis, P_Ho, P_He)

################################################################################

nona_IFis <- Fis[is.na(Fis$Indonesia), 2]
I_Fis_mean <- mean(nona_IFis)
I_Fis_ste <- std.error(nona_IFis)
I_Fis <- cbind(I_Fis_mean, I_Fis_ste)

I_Ho_mean <- mean(Ho$Indonesia)
I_Ho_ste <- std.error(Ho$Indonesia)
I_Ho <- cbind(I_Ho_mean, I_Ho_ste)

I_He_mean <- mean(He$Indonesia)
I_He_ste <- std.error(He$Indonesia)
I_He <- cbind(I_He_mean, I_He_ste)

I_div_sum <- cbind(I_Fis, I_Ho, I_He)

################################################################################

tot_div_sum <- data.frame(rbind(J_div_sum, P_div_sum, I_div_sum))
tot_div_sum$Pop <- c("Japan",)
  colnames(total_div_sum) <- c("Fis_mean", "Fis_sterror", "Ho_mean", "Ho_sterror", "He_mean", "He_sterror", "Population")
  rwoname(tot_div_sum) <- c("Japan", "Philippines", "Indonesia")

write.csv(tot_div_sum, "diversity_mean_std.csv")
  
################################################################################

Fis_mean <- c(mean_Fis_I, mean_Fis_J, mean_Fis_P)
Ho_mean <- c(mean_Ho_I, mean_Ho_J, mean_Ho_P)
He_mean <- c(mean_He_I, mean_He_J, mean_He_P)

################################################################################

Fis_plot <- ggplot(data = tot_div_sum, aes(x = Population, y = Fis_mean)) + geom_point() + 
  geom_errorbar(aes(ymin = Fis_mean - Fis_sterror, ymax = Fis_mean + Fis_sterror))
Fis_plot

Ho_plot <- ggplot(data = tot_div_sum, aes(x = Pop2, y = Ho_mean)) + geom_point(shape = 24, fill = "blue") + 
  geom_errorbar(aes(ymin = Ho_mean - Ho_sterror, ymax = Ho_mean + Ho_sterror))
Ho_plot

He_plot <- ggplot(data = tot_div_sum, aes(x = Pop2, y = He_mean)) + geom_point(shape = 24, fill = "blue") + 
  geom_errorbar(aes(ymin = He_mean - He_sterror, ymax = He_mean + He_sterror))
He_plot










library(dplyr)
#ggplot2(data = "GeneticDiversity.csv")
#(mapping = aes(x = div, y = pop))
mean_Fis <- cbind("mean_Fis_I", "mean_Fis_P", "mean_Fis_J")
write.csv(mean_Fis, file = "mean_Fis")
"mean_Fis.csv" <- cbind(-0.01528404, 0.01537092, -0.07807031)

Population <- c("Indonesia", "Philippines", "Japan")
Diversity <- c(-0.01528404, 0.01537092, -0.07807031)
df_Fis <- data.frame(Diversity, 
                     Population)
df_Fis2 <- arrange(df_Fis)

df_Fis2
head(df_Fis2)

library(ggplot2)
p <- ggplot(data = df_Fis2, aes(x = Population, y = Diversity,)) + 
  geom_point(shape = 24, fill = "blue") 
p

################################################################################

library(dplyr)
#ggplot2(data = "GeneticDiversity.csv")
#(mapping = aes(x = div, y = pop))
mean_Ho <- cbind("mean_Ho_I", "mean_Ho_P", "mean_Ho_J")
write.csv(mean_Ho, file = "mean_Ho")
"mean_Ho.csv" <- cbind(0.24604098, 0.244634378, 0.23783238)

Population <- c("Indonesia", "Philippines", "Japan")
Observed_Heterozygosity <- c(0.24604098, 0.244634378, 0.23783238)
df_Ho <- data.frame(Observed_Heterozygosity, 
                    Population)

df_Ho
head(df_Ho)

library(ggplot2)
p <- ggplot(data = df_Ho, aes(x = Population, y = Observed_Heterozygosity,)) + 
  geom_point(shape = 24, fill = "blue") 
p

################################################################################

library(dplyr)
#ggplot2(data = "GeneticDiversity.csv")
#(mapping = aes(x = div, y = pop))
mean_He <- cbind("mean_He_I", "mean_He_P", "mean_He_J")
write.csv(mean_He, file = "mean_He")
"mean_He.csv" <- cbind(0.24033018, 0.24356554, 0.21164717)

Population <- c("Indonesia", "Philippines", "Japan")
Expected_Heterozygosity <- c(0.24033018, 0.24356554, 0.21164717)
df_He <- data.frame(Diversity, 
                    Population)
df_He 
head(df_He)

library(ggplot2)
p <- ggplot(data = df_He, aes(x = Population, y = Expected_Heterozygosity,)) + 
  geom_point(shape = 24, fill = "blue") 
p

################################################################################
library(ggplot2)
library(plotrix)
#Fis scatterplot
df_Fis2 <- ggplot(data = tot_div_sum, aes(x = Population, y = Diversity)) + geom_point() + 
  geom_errorbar(aes(ymin = Diversity - Fis_sterror, ymax = Diversity + Fis_sterror))
df_Fis2 
df_Fis2

















  #  "","Fis_mean","Fis_sterror","Ho_mean","Ho_sterror","He_mean","He_sterror","Pop"
 # "Japan",-0.0780703145917001,0.00639256685775754,0.237832383665717,0.0039451908313947,0.211647174738841,0.00283949388903282,"Japan"
#  "Philippines",0.0153709180868609,0.00587163488207089,0.244634377967711,0.0033439210952892,0.243565455840456,0.00254214251350851,"Philippines"
 # "Indonesia",-0.0152840415180019,0.00673450593152957,0.246040978157645,0.00374611428346496,0.240330175688509,0.00293040346786899,"Indonesia"