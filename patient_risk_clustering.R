
# Patient Risk Clustering in R

# Load required libraries
library(ggplot2)
library(dplyr)
library(cluster)
library(factoextra)
library(readr)
library(caret)

# Load dataset
data <- read_csv("patient_risk_clustering.csv")

# Convert categorical to numeric
data$Smoker <- ifelse(data$Smoker == "Yes", 1, 0)

# Handle missing values if any
data <- na.omit(data)

# Normalize numeric columns
preproc <- preProcess(data, method = c("center", "scale"))
data_norm <- predict(preproc, data)

# Determine optimal number of clusters using Elbow Method
fviz_nbclust(data_norm, kmeans, method = "wss") + 
  labs(title = "Elbow Method for Optimal Clusters")

# Silhouette Method
fviz_nbclust(data_norm, kmeans, method = "silhouette") + 
  labs(title = "Silhouette Method")

# Apply K-means clustering (assuming k = 3)
set.seed(123)
kmeans_model <- kmeans(data_norm, centers = 3, nstart = 25)
data$Cluster <- as.factor(kmeans_model$cluster)

# Visualize clusters using PCA
fviz_cluster(kmeans_model, data = data_norm, 
             geom = "point", ellipse.type = "convex", 
             palette = "jco", ggtheme = theme_minimal())

# Cluster profiling
summary_stats <- data %>%
  group_by(Cluster) %>%
  summarise(
    Avg_Age = mean(Age),
    Avg_BMI = mean(BMI),
    Avg_BP = mean(Blood_Pressure),
    Avg_Glucose = mean(Glucose),
    Avg_Chronic = mean(Chronic_Diseases),
    Smoker_Rate = mean(Smoker)
  )

print(summary_stats)
