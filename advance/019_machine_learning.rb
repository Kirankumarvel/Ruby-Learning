# Numo for Scientific Computing
require 'numo/narray'

# Simple linear regression
def linear_regression(x, y)
  x_mean = x.mean
  y_mean = y.mean
  
  numerator = ((x - x_mean) * (y - y_mean)).sum
  denominator = ((x - x_mean)**2).sum
  
  slope = numerator / denominator
  intercept = y_mean - (slope * x_mean)
  
  [slope, intercept]
end

x = Numo::DFloat[1, 2, 3, 4, 5]
y = Numo::DFloat[2, 4, 5, 4, 5]
slope, intercept = linear_regression(x, y)

puts "y = #{slope.round(2)}x + #{intercept.round(2)}"
