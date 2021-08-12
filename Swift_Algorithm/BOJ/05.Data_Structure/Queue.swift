//
//  Queue.swift
//  Swift_Algorithm
//
//  Created by IT learning on 2021/08/12.
//

import Foundation

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


// 시간복잡도
// enqueue : O(1)
// dequeue : O(N)
