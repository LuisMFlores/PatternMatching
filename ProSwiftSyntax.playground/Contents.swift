import UIKit

//runSyntaxChapter()

// Labeled statements

var board = [[String]](repeating: [String].init(repeating: "", count: 10), count: 5)
board[3][5] = "x"

print(board)

rowLoop: for (rowIndex, cols) in board.enumerated() {
    columnLoop: for (colIndex, col) in cols.enumerated() {
        if col == "x" {
            print("Found it at row \(rowIndex) column \(colIndex)")
            break rowLoop
        }
    }
}
