install.packages("tidyverse") # these packages were the ones you said I needed, but they aren't necessarily used here
install.packages("hierfstat")
install.packages("adegenet")
install.packages("pegas")
install.packages("Relatedness")
mydata <= read.table("Master_Pinus_data_genotype.txt", header = TRUE)
dim(mydata) 
locus <- mydata[ -c(1, 2, 3, 4, 17:3086)]
colnames(locus) <- gsub("\\.", "_", colnames(locus))
ind <- as.character(mydata$tree_id)
population <- as.character(mydata$state)
mydata1 <- df2genind(locus, ploidy = 2, ind.names = ind, pop = population, sep = " ")
mydata1
nA11(mydata1)
div <- summary(mydata1)
div
names(div)
plot(div$Hobs, xlab = "Loci number", ylab = "Observed Heterogygosity", main = "Observed heterozygosity per locus")
plot(div$Hobs, div$Hexp, xlab = "Hobs", ylab = "Hexp", main = "Expectered heterozygosity as a function of observed heterozygosity per locus")
bartlett.test(list(div$Hexp, div$Hobs))
basicstat <- basic.stats(mydata2, diploid = TRUE, digits = 2)
names(basicstat)
boot.ppfis(mydata2)
x <- indpca (mydata2)
plot(x, cex = 0.7)
hw.test(mydata1, B = 1000)
options(width = 100)
devtools::session_info() # The data did not properly download, but seeing the tutorial I should've had graphs 