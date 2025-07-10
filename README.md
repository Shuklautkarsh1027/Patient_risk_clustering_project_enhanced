# Patient Risk Clustering using R

# Overview

This project applies unsupervised machine learning (K-Means Clustering) to segment patients into low, medium, and high-risk categories based on key health indicators like:

- Age  
- BMI  
- Blood Pressure  
- Glucose Level  
- Chronic Conditions  

The goal is to help hospitals and healthcare analytics teams prioritize care and optimize intervention strategies.

---

# Dataset Features

| Feature            | Description                                                |
| ------------------ | ---------------------------------------------------------- |
| Age                | Age of the patient                                         |
| BMI                | Body Mass Index                                            |
| Blood_Pressure     | Systolic blood pressure                                    |
| Glucose            | Blood glucose level                                        |
| Smoker             | Smoking status (Yes/No)                                    |
| Chronic_Diseases   | Number of chronic illnesses (e.g., diabetes, hypertension) |

Note: This dataset is synthetic and created for educational and analytical learning purposes.

---

# Tools & Libraries Used

- Language: R  
- Libraries: ggplot2, dplyr, cluster, factoextra, caret, readr

---

# Objectives

- Normalize and preprocess healthcare data  
- Identify optimal number of clusters using Elbow Method and Silhouette Score  
- Apply K-Means Clustering to segment patients  
- Visualize patient clusters using PCA plots  
- Generate health profiles for each cluster  

---

# Methodology Summary

1. Data Preprocessing  
   - Handle missing values  
   - Encode categorical variables  
   - Normalize features using scaling

2. Finding Optimal k  
   - Use Elbow Method (WSS Plot)  
   - Use Silhouette Score

3. Clustering  
   - Apply K-Means (k = 3)  
   - Add cluster labels to original dataset

4. Visualization  
   - Apply PCA to reduce dimensions  
   - Plot 2D clusters using ggplot2

5. Cluster Profiling  
   - Calculate mean values for each feature per cluster  
   - Assign risk labels based on health indicators

---

# Sample Outputs

- Elbow Method Plot  
- Silhouette Score Plot  
- PCA Cluster Visualization  
- Table showing cluster-wise health summary  

---

## Sample Result: Cluster Profiles

| Cluster | Avg Age | Avg Glucose | Smoker Rate | Risk Level    |
|--------:|--------:|-------------:|-------------:|----------------|
| 0       | 63      | 148          | 40%          | High Risk      |
| 1       | 45      | 98           | 10%          | Low Risk       |
| 2       | 52      | 120          | 25%          | Medium Risk    |


