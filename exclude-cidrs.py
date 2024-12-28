import ipaddress  # Get the initial IP range from the user
all_ips_input = input("Please enter the initial IP range (in CIDR format, like 0.0.0.0/0): ")
all_ips = ipaddress.IPv4Network(all_ips_input)

# Get the exclude IP ranges from the user
exclude_ranges = []
while True:
    exclude_input = input("Please enter the IP range you want to exclude (in CIDR format, like 10.0.0.0/8) or 'n' to finish: ")
    if exclude_input.lower() == 'n':  # When the user enters 'n', the input process ends.
        break
    try:
        exclude_ranges.append(ipaddress.IPv4Network(exclude_input))
    except ValueError:
        print("Incorrect input format. Please try again.")

# Exclude the ranges
remaining_ranges = [all_ips]
for ex in exclude_ranges:
    temp_ranges = []
    for r in remaining_ranges:
        # Ensure that exclusion happens only if the exclude range is within the base range
        if ex.subnet_of(r):
            temp_ranges.extend(r.address_exclude(ex))
        else:
            print(f"Warning: The range {ex} is not contained within {r}. Exclusion skipped.")
            temp_ranges.append(r)
    remaining_ranges = temp_ranges

# Sort the remaining ranges in order
remaining_ranges = sorted(remaining_ranges, key=lambda x: int(x.network_address))

# Display the remaining ranges
print("\nRemaining IP ranges:")
for r in remaining_ranges:
    print(r)

# Pause to view the output
input("\nPress Enter to exit...")
