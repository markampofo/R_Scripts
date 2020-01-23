#The apply() function is great for simulating survival data. Suppose we
#want to simulate n = 10 observations where, the event times T follow an
#exponential distribution with mean ?? = 0.25 and the censoring times C are
#distributed uniformly from 0 to 1. Then the observed data is,
#X = min(T, C) and ?? = I(T < C).

# Sample size
n = 10

# Generate event and censor times (look at the documentation to see
# how R parameterizes the exponential distribution)
event <- rexp(n, 4)
censor <- runif(n)

# Select the minimum time and create an indicator variable
time <- apply(cbind(censor, event), 1, min)
index <- apply(cbind(censor, event), 1, which.min)-1
cbind(event, censor, time, index) # Verify
data <- cbind(time, index) # Simulated dataset