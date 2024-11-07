TP <- 30    # True Positives
FP <- 58    # False Positives
TN <- 920   # True Negatives
FN <- 32    # False Negatives

# Create a matrix
conf_matrix <- matrix(c(TN, FN, FP, TP), nrow = 2, byrow = TRUE)
colnames(conf_matrix) <- c("Predicted Negative", "Predicted Positive")
rownames(conf_matrix) <- c("Actual Negative", "Actual Positive")

# Function to display the confusion matrix
print_confusion_matrix <- function(conf_matrix) {
    cat("\nConfusion Matrix:\n")
    print(conf_matrix)
}

# Calculate metrics
calculate_metrics <- function(TP, FP, TN, FN) {
    # Total observations
    total <- TP + FP + TN + FN
    
    # Accuracy
    accuracy <- (TP + TN) / total
    
    # Error Rate
    error_rate <- (FP + FN) / total
    
    # Sensitivity (True Positive Rate or Recall)
    sensitivity <- TP / (TP + FN)
    
    # Specificity (True Negative Rate)
    specificity <- TN / (TN + FP)
    
    # Create and return results data frame
    metrics <- data.frame(
        Metric = c("Accuracy", "Error Rate", "Sensitivity", "Specificity"),
        Value = c(accuracy, error_rate, sensitivity, specificity)
    )
    
    return(metrics)
}

# Display results
print_confusion_matrix(conf_matrix)

# Calculate and display metrics
metrics <- calculate_metrics(TP, FP, TN, FN)
cat("\nEvaluation Metrics:\n")
print(metrics, row.names = FALSE)