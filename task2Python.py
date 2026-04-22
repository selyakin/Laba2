def get_message_type(N, frequencies):
    if N < 2:
        return "Неподходящий N"
    
    for freq in frequencies:
        if freq <= 0:
            return "Error: частота должна быть больше нуля"
    
    increasing = False
    decreasing = False
    vstrechaIsOK = False
    
    if N > 2:
        vstrechaIsOK = True
    
    if frequencies[0] < frequencies[1]:
        increasing = True
    elif frequencies[0] > frequencies[1]:
        decreasing = True
    
    for i in range(2, N):
        if increasing and (frequencies[i-1] > frequencies[i]):
            increasing = False
        if decreasing and (frequencies[i-1] < frequencies[i]):
            decreasing = False
        if frequencies[i-1] == frequencies[i]:
            return "ШУМ"
        if vstrechaIsOK and ((frequencies[i-2] > frequencies[i-1]) == (frequencies[i-1] > frequencies[i])):
            vstrechaIsOK = False
    
    if increasing:
        return "АТАКАКА"
    if decreasing:
        return "ОТСТУПЛЕНИЕ"
    if vstrechaIsOK:
        return "ВСТРЕЧА"
    return "ШУМ"


def main():
    try:
        N = int(input("Введите кол-во сигналов N: "))
        
        if N <= 0:
            print("Ошибка: N должно быть положительным")
            return
        
        frequencies = list(map(int, input(f"Введите {N} частоты: ").split()))
        
        if len(frequencies) != N:
            print(f"Ошибка: введено {len(frequencies)} частот, ожидалось {N}")
            return
        
        print(get_message_type(N, frequencies))
    
    except ValueError:
        print("Ошибка: введите корректные целые числа")


if __name__ == "__main__":
    main()
