# Function to add two numbers
def add(x, y):
    return x + y

# Function to subtract two numbers
def subtract(x, y):
    return x - y

# Function to multiply two numbers
def multiply(x, y):
    return x * y

# Function to divide two numbers
def divide(x, y):
    # Check if divisor is zero to avoid division by zero error
    if y == 0:
        return "Cannot divide by zero"
    else:
        return x / y

# Get input from the user
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))

# Perform arithmetic operations
addition = add(num1, num2)
subtraction = subtract(num1, num2)
multiplication = multiply(num1, num2)
division = divide(num1, num2)

# Print the results
print("Addition:", addition)
print("Subtraction:", subtraction)
print("Multiplication:", multiplication)
print("Division:", division)

