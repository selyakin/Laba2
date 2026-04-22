#include <iostream>
#include <string>
#include <vector>

using namespace std;

string canCoverge(int N, int X, const string& S) {

    if (N < 0) return "Error: must N >= 0!";
    if (X < 0) return "Error: must X >= 0!";

    if (S.length() != N) {
        return "Error: S length must be N!";
    }

    vector<bool> towerCoverage(N, false);

    for (int i = 0; i < N; ++i) {
        if (S[i] == '1') {
            int left = (i - X) < 0 ? 0 : i - X;
            int right = (i + X) > (N - 1) ? N - 1 : i + X;

            for (int j = left; j <= right; ++j) {
                towerCoverage[j] = true;
            }
        }
        else if (S[i] != '0') {  
            return "Error: S must contain only 0 and 1!";
        }
    }

    for (int i = 0; i < N; ++i) {
        if (!towerCoverage[i]) {
            return "No";
        }
    }

    return "Yes";
}

int main() {
    int N, X;
    string S;

    cout << "Enter N, X and string S: ";
    cin >> N >> X >> S;

    cout << canCoverge(N, X, S) << endl;

    return 0;
}
