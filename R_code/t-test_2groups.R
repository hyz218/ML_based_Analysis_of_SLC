#https://rpkgs.datanovia.com/ggpubr/reference/stat_compare_means.html

.Machine$double.eps
.Machine$double.eps <- 1.0e-500

# SLC / fold-change / expression(increase/decrease) / p-value / control_mean / control_distribution / treat_mean / treat_distribution


# Load data
total <-
  read.csv('/Users/eun/Desktop/SLC_Liver/t-test/TCGA_GTEX_Testis_t_test.csv',
           header = TRUE,
           sep = ",")
total

# Two independent groups
#install.packages('ggpubr')
library('ggpubr')
library('dplyr')
library('ggplot2')

# Two independent groups
col.name <- colnames(total)

col.name

# label ?? ????
GTEx <- total[total['label'] == 0,] # gtex
TCGA <- total[total['label'] == 1,] # tcga

# SLC / fold-change / expression(increase/decrease) / p-value / control_mean / control_distribution / treat_mean / treat_distribution
df <-
  data.frame(
    category = character(),
    SLC = character(),
    fold_change = numeric(),
    expression = character(),
    p_value = numeric(),
    control_mean = numeric(),
    control_distribution = numeric(),
    treat_mean = numeric(),
    treat_distribution = numeric()
  )

#에러나서 넣어둠 
#if(!require(devtools)) install.packages("devtools")
#devtools::install_github("kassambara/ggpubr")


# SLC ????
nCol <- ncol(total)
for (i in 2:(nCol-1)) {
  myplot <- ggboxplot(
    total,
    x = "label",
    y = col.name[i],
    color = "label",
    palette = c("#FF0000", "#009900"),
    add = "jitter"
  ) +
    stat_compare_means(method = "t.test")
  
  print(col.name[i])
  
  n_row_GTEx <- nrow(GTEx)
  n_row_TCGA <- nrow(TCGA)
  
  GTEx_mean <- mean(total[1:n_row_GTEx, i])
  TCGA_mean <-
    mean(total[(n_row_GTEx + 1):(n_row_GTEx + n_row_TCGA), i])
  
  GTEx_var <- var(total[1:n_row_GTEx, i])
  TCGA_var <-
    var(total[(n_row_GTEx + 1):(n_row_GTEx + n_row_TCGA), i])
  
  comparision <-
    if (TCGA_mean > GTEx_mean) {
      print('Increased')
    } else{
      print('Decreased')
    }
  
  fold_change <- TCGA_mean / GTEx_mean
  print(fold_change)
  
  result <-
    t.test(total[(n_row_GTEx + 1):(n_row_GTEx + n_row_TCGA), i], total[1:n_row_GTEx, i])
  p_val <- result$p.value
  print(p_val)

  ggsave(
    myplot,
    filename = paste(
      col.name[i],
      "_",
      comparision,
      "_Fold_change=",
      fold_change,
      "_p-val=",
      p_val,
      ".png",
      sep = ""
    )
  )

  data <-
    data.frame(
      category='Testis',
      SLC = col.name[i],
      fold_change = fold_change,
      expression = comparision,
      p_value = p_val,
      control_mean = GTEx_mean,
      control_distribution = GTEx_var,
      treat_mean = TCGA_mean,
      treat_distribution = TCGA_var
    )
  df <- rbind(df, data)
}

# ???? ????
write.csv(df, '/Users/eun/Desktop/SLC_Liver/t-test/TCGA_GTEX_Adrenal_t_test_summary.csv')



# make data table return value from get.cutoff
exp <- data.table(method, unlist(res)[1], mk)
colnames(exp) <- c("Method", "Threshold_Description", "Marker")
# append
colr[[c]] <- exp
message(paste(method, exp$Marker, "      FINISHED"))

#make the list of file names
#
# file_list <-
#   list.files(
#     path = "./",
#     pattern = NULL,
#     all.files = FALSE,
#     full.names = FALSE,
#     recursive = FALSE,
#     ignore.case = FALSE,
#     include.dirs = FALSE,
#     no.. = FALSE
#   )
# install.packages('xlsx')
# library(xlsx)
# write.xlsx(file_list, "File_list.xlsx")
