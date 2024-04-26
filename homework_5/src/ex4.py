# Define the list
my_list = ["apple", "pear", "plum", "cherry", "banana"]

# Define the element to search for
element_to_search = input("Enter the element to search for: ")

# Check if the element is present in the list
if element_to_search in my_list:
    print('Yes, the element "{}" exists.'.format(element_to_search))
else:
    print('No, the element "{}" does not exist.'.format(element_to_search))

