function canCoverge(N, X, S) {
    if (N < 0) return "Error: must N >= 0!";
    if (X < 0) return "Error: must X >= 0!";
    
    if (S.length !== N) {
        return "Error: S length must be N!";
    }
    
    const towerCoverage = new Array(N).fill(false);
    
    for (let i = 0; i < N; i++) {
        if (S[i] === '1') {
            const left = Math.max(0, i - X);
            const right = Math.min(N - 1, i + X);
            
            for (let j = left; j <= right; j++) {
                towerCoverage[j] = true;
            }
        }
        else if (S[i] !== '0') {
            return "Error: S must contain only 0 and 1!";
        }
    }
    
    return towerCoverage.every(covered => covered) ? "Yes" : "No";
}

console.log(`N = 4, X = 1, S = "1001" - ${canCoverge(4, 1, "1001")}`); 
console.log(`N = 4, X = 0, S = "1001" - ${canCoverge(4, 0, "1001")}`); 
console.log(`N = 5, X = 1, S = "10001" - ${canCoverge(5, 1, "10001")}`); 
