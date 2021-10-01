# Machine Learning-Based Analysis of SLC Superfamily and Their Clinical Significance in Pan-cancer

The tumor microenvironment is important for the growth of cancer, triggering particular biochemical and physiological changes. We hypothesized that solute carriers (SLCs), which play a major role in the transport of small molecules in cancer, can alter the cancer aggressiveness. To test this, our study focused on a
specific expression patterns of SLC molecules relevant to 33 cancer prognosis using public transcriptomic database such as TCGA and GTEx. 103 SLC genes are significantly associated with increased expression levels and poor prognosis of cancers. Our machine learning including linear SVM, XGBoost, Random Forest and K-NN showed over 0.93 accuracies, supporting this set of SLC genes may potentiate a prioritized association with cancers. To understand cancer specific SLC genes, we performed a rigorous data analysis using dimentionality-reduction by PCA and t-SNE and correlation by network analysis, and finally ascertained the proportion of SLC biomarkers for each cancer type to demonstrate the predominantly expressed molecules. Taken together, our study showed the importance of SLC groups underlying cancer cells' expression as well as clinical prognosis and cancer-type enriched SLC biomarkers, which will envisage a role of anti-tumor therapeutics.


## Usage

----

### Clone

```
git clone https://github.com/ongdalsaem/ML_based_Analysis_of_SLC.git
cd ML_based_Analysis_of_SLC
```

### Run

```
Preprocessing & Analysis

1. Preprocessing.ipynb
2. R_analysis_data.ipynb
3-1. t-test_group2.R
3-2. survival_analysis.R
4. Biomarker_Extraction.ipynb

------------------------------------

Classification & Figures

5-1. Figure_1_Machine_Learning.ipynb	
5-2. Figure_1_Feature_Importance.ipynb	
5-3. Figure_2_PCA_t-SNE.ipynb	
5-4. Figure_2_EachCancer_PCA_t-SNE.ipynb	
5-5. Figure_3_Correlation.ipynb	
5-6. Figure_4_OncoPrinter.ipynb

```

## Outputs

[eposter_final.pdf](https://github.com/hyz218/ML_based_Analysis_of_SLC/files/7264266/eposter_final.pdf)
