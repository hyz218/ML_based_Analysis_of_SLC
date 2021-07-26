#https://jokergoo.github.io/circlize_book/book/introduction.html
install.packages("circlize")
library("circlize")

correlation2 <- read.csv(file = 'correlation_21.csv',header = TRUE, sep = ",")
rownames(correlation2) = colnames(correlation2[2:22])
correlation2 <- correlation2[,-1]   #first column remove
correlation2

correlation_2 <- as.matrix(correlation2)


grid.col = c(SLC17A4 = "#F99B45",SLC16A4="#F99B45",SLC28A1="#F99B45",SLC15A4="#F99B45",SLC6A3="#F99B45",SLC22A11="#F99B45",SLC22A2="#F99B45",SLC34A1="#F99B45",
             SLC12A5="#A58CB3", SLC10A4="#A58CB3", SV2C="#A58CB3", SLC30A3="#A58CB3", SLC32A1="#A58CB3", SLCO1A2="#A58CB3", SFXN5="#A58CB3",
             SLC30A6="#284E60",SLC30A7="#284E60",SLC25A43="#284E60",NIPA2="#284E60",SLC25A24="#284E60",FLVCR1="#284E60")
chordDiagram(correlation_2,grid.col=grid.col)
circos.clear()
