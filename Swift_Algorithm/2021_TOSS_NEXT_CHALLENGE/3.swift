import Foundation
//3번
func solution(_ n:Int, _ keyInputs:[Int]) -> String {
    var tmp: [Int] = []
    var result: String = ""
    for key in keyInputs {
        if key == -2 {
            if tmp.isEmpty == false {
                tmp.removeAll()
            }
        } else if key == -1 {
            if tmp.isEmpty == false {
                tmp.removeLast()
            }
            
        } else {
            if tmp.count < n {
                tmp.append(key)
            }
        }
    }
    
    if tmp.count < n {
        result = ""
    } else {
        for i in tmp {
            result += String(i)
        }
    }
    
    return result
}
