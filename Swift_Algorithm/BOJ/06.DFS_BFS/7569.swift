// BOJ 7569 - 토마토
// 이 문제는 덱으로 충분히 풀 수 있는 문제지만, 스위프트는 워낙 느리기에 O(N)으로도 잘 안돌아갔다.
// 따라서 투포인터를 사용해 인덱스를 옮기는 작업을 하였고, 그러고 난 뒤에는 파이썬보다 빠른 코드가 되었다 ㅋㅋ


import Foundation


let read = readLine()?.split(separator: " ").map { Int(String($0))! }
let m = (read?[0])!
let n = (read?[1])!
let h = (read?[2])!

var board = Array<Array<Array<Int>>>()

let dx = [0,-1,0,1,0,0]
let dy = [-1,0,1,0,0,0]
let dz = [0,0,0,0,-1,1]

for _ in 0...h-1 {
    var tmp = Array<Array<Int>>()
    for _ in 0...n-1 {
        let imp = readLine()?.split(separator: " ").map { Int(String($0))! }
        tmp.append(imp!)
    }
    board.append(tmp)
}

var q = Array<Array<Int>>()

for i in 0...h-1 {
    for j in 0...n-1 {
        for k in 0...m-1 {
            if board[i][j][k] == 1 {
                q.append([i,j,k])
            }
        }
    }
}

var left = 0
var right = q.count

func bfs() {
    while left < right {
        let array = q[left]
        let z: Int = array[0]
        let x: Int = array[1]
        let y: Int = array[2]
        for i in 0...5 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nz = z + dz[i]
            if nx < 0 || ny < 0 || nz < 0 || nx >= n || ny >= m || nz >= h {
                continue
            }
            if board[nz][nx][ny] == 0 {
                board[nz][nx][ny] = board[z][x][y] + 1
                q.append([nz,nx,ny])
                right += 1
            }
        }
        left += 1
    }
}

func result() -> Int {
    var total: Int = 0
    for i in 0...h-1 {
        for j in 0...n-1 {
            for k in 0...m-1 {
                if board[i][j][k] == 0 {
                    return -1
                }
                total = max(total, Int(board[i][j][k]))
            }
        }
    }
    return total-1
}

bfs()
print(result())
