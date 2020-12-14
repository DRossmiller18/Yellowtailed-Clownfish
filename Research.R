library(hierfstat)
library(tidyverse)

sum_stats_mac2 <- readRDS("sum_stats_mac2.RDS")

################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosisty for Japan population
J_Ho <- Ho[,1]
J_Ho_df <- data.frame(J_Ho)
J_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

He <- sum_stats_mac2$Hs #Homozygosity for Japan population
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

Ho <- sum_stats_mac2$Ho #Heterozygosisty for Philippines population
P_Ho <- Ho[,3]
P_Ho_df <- data.frame(P_Ho)
P_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

He <- sum_stats_mac2$He #Homozygosity for Philippines population
P_He <- He[,1]
P_He_df <- data.frame(P_He)
P_He_df <- data.frame(sum_stats_mac2$He[,1])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Philippines population
P_Fis <- Ho[,1]
P_Fis_df <- data.frame(P_Fis)
P_Fis_df <- data.frame(sum_stats_mac2$Fis[,1])

mean_Ho_P <- mean(P_Ho)
mean_Ho_P

mean_He_P <- mean(P_He)
mean_He_P

mean_Fis_P <- mean(P_Fis)
mean_Fis_P

################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosisty for Indonesia population
I_Ho <- Ho[,1]
I_Ho_df <- data.frame(I_Ho)
I_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

He <- sum_stats_mac2$He #Homozygosity for Indonesia population
I_He <- He[,1]
I_He_df <- data.frame(I_He)
I_He_df <- data.frame(sum_stats_mac2$He[,1])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Indonesia population
I_Fis <- Ho[,1]
I_Fis_df <- data.frame(I_Fis)
I_Fis_df <- data.frame(sum_stats_mac2$Fis[,1])

mean_Ho_I <- mean(I_Ho)
mean_Ho_I

mean_He_I <- mean(I_He)
mean_He_I

mean_Fis_I <- mean(I_Fis)
mean_Fis_I

################################################################################

write.csv(Ho, "Ho.csv")
write.csv(He, "He.csv")
write.csv(Fis, "Fis.csv")

GeneticDiversity <- cbind(Ho, He, Fis)
write.csv(GeneticDiversity, "GeneticDiversity.csv")
