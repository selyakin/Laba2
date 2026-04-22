import java.util.Scanner;

public class task1Java {
    
    public static String canCoverge(int N, int X, String S) {
        
        if (N < 0) return "Error: must N >= 0!";
        if (X < 0) return "Error: must X >= 0!";
        
        if (S.length() != N) {
            return "Error: S length must be N!";
        }
        
        boolean[] towerCoverage = new boolean[N];
        
        for (int i = 0; i < N; ++i) {
            if (S.charAt(i) == '1') {
                int left = (i - X) < 0 ? 0 : i - X;
                int right = (i + X) > (N - 1) ? N - 1 : i + X;
                
                for (int j = left; j <= right; ++j) {
                    towerCoverage[j] = true;
                }
            }
            else if (S.charAt(i) != '0') {  
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
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter N, X and string S: ");
        int N = scanner.nextInt();
        int X = scanner.nextInt();
        String S = scanner.next();
        
        System.out.println(canCoverge(N, X, S));
        
        scanner.close();
    }
}
