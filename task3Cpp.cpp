#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

string primeNumbers(int N, const vector<int>& numbers) {
    if (N <= 0) {
        return "Error: некорректный N";
    }
    for (int el : numbers) {
        if (el <= 0) return "Error: некорректное число (только натуральные числа)";
    }

    string result = "";

    for (int el : numbers) {
        if (result != "") result += " ";

        bool isPrime = true;

        if (el == 1) {
            isPrime = false;
        }
        else {
            int f = sqrt(el);
            for (int x = 2; x <= f && isPrime; ++x) {
                if (el % x == 0) {
                    isPrime = false;
                }
            }
        }
        result += isPrime ? "Yes" : "No";
    }
    return result;
}

int main() {
    int N;

    cout << "Введите количество чисел N: ";
    cin >> N;

    vector<int> numbers(N);

    cout << "Введите " << N << " чисел: ";
    for (int i = 0; i < N; i++) {
        cin >> numbers[i];
    }

    cout << primeNumbers(N, numbers) << endl;

    return 0;
}
