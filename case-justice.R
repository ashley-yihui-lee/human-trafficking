library(ggplot2)

setwd('~/Desktop/human-trafficking')

set.seed(42)  # Ensures reproducibility

# Define number of points
num_points <- 9014
num_highlighted <- 1656  # Number of center-highlighted dots

# Define circle center and radius
cx <- 50  # X-center
cy <- 50  # Y-center
radius_max <- 30  # Maximum radius of the full circle

# Generate random polar coordinates **for ALL dots**
r_all <- sqrt(runif(num_points, min = 0, max = 1)) * radius_max  # Even distribution
theta_all <- runif(num_points, min = 0, max = 2 * pi)  # Random angles

# Convert polar coordinates to Cartesian
df <- data.frame(
  x = cx + r_all * cos(theta_all),
  y = cy + r_all * sin(theta_all),
  group = "normal"
)

# Select **1,656 dots closest to the center** for highlighting
df$distance <- sqrt((df$x - cx)^2 + (df$y - cy)^2)  # Calculate distance from center
highlighted_indices <- order(df$distance)[1:num_highlighted]  # Pick the closest ones
df$group[highlighted_indices] <- "highlighted"

# Create scatter plot
ggplot(df, aes(x, y, color = group)) +
  geom_point(size = 0.5, alpha = 0.6) +
  scale_color_manual(values = c("normal" = "#d4dcda", "highlighted" = "#00496D")) +  # Define colors
  theme_void() +  # Remove axes
  theme(legend.position = "none")  # Hide legend

# Save the plot
ggsave("cases-justice.png", width = 1000 / 100, height = 600 / 100, dpi = 300)
