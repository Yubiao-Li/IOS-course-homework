import UIKit

enum Suit {
    case Diamond, Club, Heart, Spade
    func simpleDescription() -> String {
        switch self {
        case .Spade:
            return "spade"
        case .Heart:
            return "heart"
        case .Diamond:
            return "diamond"
        case .Club:
            return "club"
        }
    }
    static let allValue = [Diamond, Club, Heart, Spade]
}


enum Value:Int {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "A"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
    static let allValue = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
}


class Poke {
    var suit:Suit
    var value:Value
    init(suit: Suit,value: Value) {
        self.suit = suit
        self.value = value
    }
    func toString() -> String {
        return "\(suit.simpleDescription()) of \(value.simpleDescription())"
    }
}

var pokes = [Poke]()
for s in Suit.allValue {
    for v in Value.allValue{
        pokes.append(Poke(suit: s, value: v))
    }
}


func shuffle(arr:[Poke]) -> [Poke]{
    var data:[Poke] = arr
    for i in 0..<arr.count{
        let index = Int(arc4random()%52)
        let temp = data[i]
        data[i] = data[index]
        data[index] = temp
    }
    return data
}

func deal(numOfPeople:Int,numOfCard:Int)-> [[String]]{

    var result = [[String]]()
    for _ in 0..<numOfPeople{
        result.append([])
    }
    var count:Int // 需要发牌的数量
    
    pokes = shuffle(arr: pokes)
    if numOfPeople * numOfCard > pokes.count{
        count = pokes.count
    }else{
        count = numOfCard * numOfPeople
    }
    for i in 0..<count{
        result[i%numOfPeople].append(pokes[i].toString())
    }
    return result
}

// 发牌，获取每个人得到的牌的数组
let result = deal(numOfPeople: 2, numOfCard: 54)
for i in 0..<result.count{
    print("第 \(i + 1) 个人的牌:")
    print(result[i])
}
