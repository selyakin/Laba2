#include <iostream>
#include <vector>
#include <string>

using namespace std;

string getMessageType(int N, const vector<int>& frequencies) {
    
    if (N < 2) {
        return "Неподходящий N";
    }
    for (int i = 0; i < N; ++i) {
        if (frequencies[i] <= 0) {
            return "Error: частота должна быть больше нуля";
        }
    }

    bool increasing = false;
    bool decreasing = false;
    bool vstrechaIsOK = false;

    if (N > 2) {
        vstrechaIsOK = true;
    }
    if (frequencies[0] < frequencies[1]) {
        increasing = true;
    }
    else if (frequencies[0] > frequencies[1]){
        decreasing = true;
    }


    for (int i = 2; i < N; ++i) {
        if (increasing && (frequencies[i - 1] > frequencies[i])) {
            increasing = false;
        }
        if (decreasing && (frequencies[i - 1] < frequencies[i])) {
            decreasing = false;
        }
        if (frequencies[i - 1] == frequencies[i]) {
            return "ШУМ";
        }
        if (vstrechaIsOK && ((frequencies[i - 2] > frequencies[i - 1]) == (frequencies[i - 1] > frequencies[i]))) {
            vstrechaIsOK = false;
        }
    }

    if (increasing) return "АТАКАКА";
    if (decreasing) return "ОТСТУПЛЕНИЕ";
    if (vstrechaIsOK) return "ВСТРЕЧА";
    return "ШУМ";
}

int main() {
    int N;

    cout << "Введите кол-во сигналов N: ";
    cin >> N;

    vector<int> frequencies(N);

    cout << "Введите " << N << " частоты: ";
    for (int i = 0; i < N; i++) {
        cin >> frequencies[i];
    }

    cout << getMessageType(N, frequencies) << endl;

    return 0;
} 
