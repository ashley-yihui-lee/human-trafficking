library(ggplot2)

setwd('~/Desktop/human-trafficking')

set.seed(42)  # Ensures reproducibility

# Create a dataframe with 16,000 random points
df <- data.frame(
  x = runif(16000, min = 0, max = 100),  # Spread across the full area
  y = runif(16000, min = 0, max = 100)
)

# Assign a default color to all dots
df$group <- "gray"

# Calculate distance from the **top-left corner (0,100)**
df$distance <- sqrt(df$x^2 + (df$y - 100)^2)  # Euclidean distance from (0,100)

# Select the 6,006 closest points to the top-left
corner_selected <- order(df$distance)[1:6006]  # Smallest distances first

# Change their color
df$group[corner_selected] <- "#D2665A"

# Create scatter plot with colors
ggplot(df, aes(x, y, color = group)) +
  geom_point(size = 0.5, alpha = 0.6) +
  scale_color_manual(values = c("gray" = "gray", "#D2665A" = "#D2665A")) +  # Define colors
  theme_void() +  # Remove axes
  theme(legend.position = "none")  # Hide legend

# Save the plot
ggsave("sex.png", width = 10, height = 6, dpi = 300)
