library(ggplot2)

setwd('~/Desktop/human-trafficking')

set.seed(42)  # Ensures reproducibility

# Create a dataframe with 16,000 random points
df <- data.frame(
  x = runif(16554, min = 0, max = 100),  # Spread across the full area
  y = runif(16554, min = 0, max = 100)
)

# Assign a default color to all dots
df$group <- "gray"

# Calculate distance from the bottom-left corner (or another chosen corner)
df$distance <- sqrt(df$x^2 + df$y^2)  # Euclidean distance from (0,0)

# Select the 6,000 closest points
corner_selected <- order(df$distance)[1:10690]  # Smallest distances first

# Change their color
df$group[corner_selected] <- "#F9813A"

# Create scatter plot with colors
ggplot(df, aes(x, y, color = group)) +
  geom_point(size = 0.5, alpha = 0.6) +
  scale_color_manual(values = c("gray" = "gray", "#F9813A" = "#F9813A")) +  # Define colors
  theme_void() +  # Remove axes
  theme(legend.position = "none")  # Hide legend


ggsave("image2.png", width = 1000 / 100, height = 600 / 100, dpi = 300)