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

# Change their color


# Create scatter plot with colors
ggplot(df, aes(x, y, color = group)) +
  geom_point(size = 0.5, alpha = 0.6) +
  scale_color_manual(values = c("gray" = "gray")) +  # Define colors
  theme_void() +  # Remove axes
  theme(legend.position = "none")  # Hide legend


ggsave("all.png", width = 1000 / 100, height = 600 / 100, dpi = 300)