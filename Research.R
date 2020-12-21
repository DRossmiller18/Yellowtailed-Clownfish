library(hierfstat)
library(tidyverse)
sum_stats_mac2 <- readRDS("sum_stats_mac2.RDS")
################################################################################
Ho <- sum_stats_mac2$Ho #Heterozygosisty for Japan population
J_Ho <- Ho[,1]
J_Ho_df <- data.frame(J_Ho)
J_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

He <- sum_stats_mac2$He #Homozygosity for Japan population
He <- sum_stats_mac2$Hs #Homozygosity for Japan population
J_He <- He[,1]
J_He_df <- data.frame(J_He)
J_He_df <- data.frame(sum_stats_mac2$He[,1])
J_He_df <- data.frame(sum_stats_mac2$Hs[,1])

Fis <- sum_stats_mac2$Fis #Inbreeding coefficient for Japan population
J_Fis <- Ho[,1]
J_Fis <- Fis[,1]
J_Fis_df <- data.frame(J_Fis)
J_Fis_df <- data.frame(sum_stats_mac2$Fis[,1])

@@ -26,12 +26,18 @@ mean_Ho_J
mean_He_J <- mean(J_He)
mean_He_J

mean_Fis_J <- mean(J_Fis)
#removing NAs in Fis so you can calculate the mean --> make sure to do this for Philippines and Indonesia as well
J_Fis_df <- data.frame(J_Fis)
nona_JFis <- J_Fis_df[!is.na(J_Fis), ]

mean_Fis_J <- mean(nona_JFis)
mean_Fis_J

#Japan = 1, Philippines = 3, Indonesia = 2
################################################################################

Ho <- sum_stats_mac2$Ho #Heterozygosisty for Philippines population
P_Ho <- Ho[,1]
P_Ho <- Ho[,3]
P_Ho_df <- data.frame(P_Ho)
P_Ho_df <- data.frame(sum_stats_mac2$Ho[,1])

@@ -86,6 +92,5 @@ write.csv(Ho, "Ho.csv")
write.csv(He, "He.csv")
write.csv(Fis, "Fis.csv")

GeneticDiversity <- c("Ho.csv", "He.csv", "Fis.csv")
merge.data.frame(by = "Ho.csv", "He.csv", "Fis.csv") #I looked it up, but it doesn't make sense

GeneticDiversity <- cbind(Ho, He, Fis)
write.csv(GeneticDiversity, "GeneticDiversity.csv")