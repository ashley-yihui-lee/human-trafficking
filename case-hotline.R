library(ggplot2)

setwd('~/Desktop/human-trafficking')

set.seed(42)  # Ensures reproducibility

# Define number of points
num_points <- 9014

# Define circle center and radius
cx <- 50  # X-center
cy <- 50  # Y-center
radius_max <- 30  # Maximum radius of the circle

# Generate random polar coordinates (radius and angle)
r <- sqrt(runif(num_points, min = 0, max = 1)) * radius_max  # Ensures even distribution
theta <- runif(num_points, min = 0, max = 2 * pi)  # Random angles

# Convert polar coordinates to Cartesian
df <- data.frame(
  x = cx + r * cos(theta),
  y = cy + r * sin(theta)
)

# Create scatter plot
ggplot(df, aes(x, y)) +
  geom_point(size = 0.5, alpha = 0.6, color = "#d4dcda") +  # Adjust color as needed
  theme_void() +  # Remove axes
  theme(legend.position = "none")  # Hide legend

# Save the plot
ggsave("cases-hotline.png", width = 1000 / 100, height = 600 / 100, dpi = 300)
