// BOJ 13549 - 숨바꼭질 3

import Foundation

/*
public struct Queue<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }

  public mutating func append(_ element: T) {
    array.append(element)
  }
  
  public mutating func popleft() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
*/
var queue = Queue<Int>()
var board = [Int](repeating: 100000, count: 100001)
var dist = [Bool](repeating: false, count: 100001)
var n: Int = 0 // 현재 수빈이의 위치
var k: Int = 0 // 동생의 위치


var read = readLine()

if let readString = read {
    let stringArray = readString.split(separator: " ")
    n = Int(stringArray[0])!
    k = Int(stringArray[1])!
    board[n] = 0
    queue.append(n)
} else {
    print("readLine Error")
}



func bfs() {
    var delete:Int
    while !queue.isEmpty {
        let x = queue.front!
        delete = queue.popleft()!
        if x == k {
            print(board[x])
            break
        }
        
        if x*2 < 100001 && dist[x*2] == false {
            queue.append(x*2)
            board[x*2] = board[x]
            dist[x*2] = true
        }
        
        if x-1 >= 0 && dist[x-1] == false {
            queue.append(x-1)
            board[x-1] = board[x] + 1
            dist[x-1] = true
        }
        
        if x+1 < 100001 && dist[x+1] == false {
            queue.append(x+1)
            board[x+1] = board[x] + 1
            dist[x+1] = true
        }
        
    }
}

bfs()

