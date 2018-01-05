def binary_to_decimal(binary_num):

    result = 0

    for n, bit in enumerate(binary_num[::-1]):
        result += int(bit) * (2 ** n)

    return result

def main():
    binary_num = input("Enter a Binary Number: ")
    print(binary_to_decimal(binary_num))

main()
