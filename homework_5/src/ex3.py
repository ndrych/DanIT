# Define the filename
filename = "count.txt"

try:
    # Open the file for reading
    with open(filename, 'r') as file:
        # Read the numbers from the file and convert them to integers
        numbers = [int(line.strip()) for line in file.readlines()]

    # Check if the list of numbers is empty
    if not numbers:
        print("Error: File '{}' is empty.".format(filename))
    else:
        # Find the largest number
        largest_number = max(numbers)
        print("Largest number in '{}': {}".format(filename, largest_number))

except FileNotFoundError:
    print("Error: File '{}' does not exist.".format(filename))
except ValueError:
    print("Error: File '{}' contains non-integer values.".format(filename))
except Exception as e:
    print("Error:", e)

