def decimal_to_binary(decimal_num):

    result = ""

    decimal_num = int(decimal_num)

    while (decimal_num >= 1):
        result += str(decimal_num % 2)
        decimal_num = decimal_num // 2

    return result[::-1]

def main():
    decimal_num = input("Enter a Decimal Number: ")
    print(decimal_to_binary(decimal_num))

main()
