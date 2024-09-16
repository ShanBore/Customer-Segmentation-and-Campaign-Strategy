# Install necessary packages if not already installed
install.packages("dplyr")
install.packages("lubridate")

# Load the libraries
library(dplyr)
library(lubridate)

# Load the dataset
data <- read.csv("/Customer_data.csv")

# View the first few rows of the dataset
head(data)

# Clean the data
# Remove rows with missing Customer ID
data_clean <- data %>% filter(!is.na(Customer.ID))

# Convert `InvoiceDate` to Date format
data_clean$InvoiceDate <- as.Date(data_clean$InvoiceDate, format = "%Y-%m-%d %H:%M:%S")

# Remove rows with negative or zero quantities (possibly returns or errors)
data_clean <- data_clean %>% filter(Quantity > 0)

# Calculate the total amount for each line item (Quantity * Price)
data_clean <- data_clean %>%
  mutate(TotalAmount = Quantity * Price)

# Calculate the Recency, Frequency, and Monetary metrics
# Define a reference date (e.g., one day after the last transaction in the dataset)
reference_date <- max(data_clean$InvoiceDate) + days(1)

# Group data by Customer ID and calculate RFM values
rfm_data <- data_clean %>%
  group_by(Customer.ID) %>%
  summarise(
    Recency = as.numeric(difftime(reference_date, max(InvoiceDate), units = "days")),
    Frequency = n_distinct(Invoice),
    Monetary = sum(TotalAmount)
  )

# View the calculated RFM metrics
head(rfm_data)

# Rank customers into quartiles for each RFM metric
rfm_data <- rfm_data %>%
  mutate(
    R_Score = ntile(-Recency, 4),  # Use negative Recency to rank low values higher
    F_Score = ntile(Frequency, 4),
    M_Score = ntile(Monetary, 4)
  )

# Create a combined RFM score
rfm_data <- rfm_data %>%
  mutate(RFM_Score = R_Score * 100 + F_Score * 10 + M_Score)

# View the segmented data with RFM scores
head(rfm_data)

# Load ggplot2 for visualization
install.packages("ggplot2")
library(ggplot2)

# Plot the Recency distribution
ggplot(rfm_data, aes(x = Recency)) +
  geom_histogram(bins = 30, fill = "turquoise", color = "black") +
  labs(title = "Recency Distribution", x = "Recency (Days)", y = "Number of Customers")

# Plot the Frequency distribution
ggplot(rfm_data, aes(x = Frequency)) +
  geom_histogram(bins = 30, fill = "lightgreen", color = "black") +
  labs(title = "Frequency Distribution", x = "Number of Transactions", y = "Number of Customers")

# Plot the Monetary distribution
ggplot(rfm_data, aes(x = Monetary)) +
  geom_histogram(bins = 30, fill = "orange", color = "black") +
  labs(title = "Monetary Distribution", x = "Total Spend", y = "Number of Customers")

# Export the RFM data to a CSV file
write.csv(rfm_data, "/rfm_segments.csv", row.names = FALSE)

