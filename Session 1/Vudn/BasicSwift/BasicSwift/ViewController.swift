//
//  ViewController.swift
//  BasicSwift
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Exercise 1: \(exerciseOne(2, 3))")
        print("Exercise 2: \(exerciseTwo(10))")
        print("Exercise 3: \(exerciseThree(10, 12))")
        print("Exercise 4: \(exerciseFour(5, 10))")
        print("Exercise 5: \(exerciseFive("Dinh Ngoc Vu"))")
        print("Exercise 6: \(exerciseSix("Dinh Ngoc Vu", 2))")
        print("Exercise 7: \(exerciseSeven("Dinh Ngoc Vu", "Dinh", "Ngoc"))")
        print("Exercise 8: \(exerciseEight("Dinh Ngoc Vu"))")
        print("Exercise 9: \(exerciseNine(10))")
        print("Exercise 10: \(exerciseTen("Dinh Ngoc Vu", "Ngoc"))")
        print("Exercise 11: \(exerciseEleven("Dinh Ngoc Vu"))")
        print("Exercise 12: \(exerciseTwelve(10, 8))")
        print("Exercise 13: \(exerciseThirteen("Dinh Ngoc Vu"))")
        print("Exercise 14: \(exerciseFourteen(10, 20, 30))")
        print("Exercise 15: \(exerciseFifteen(10, 20))")
        print("Exercise 16: \(exerciseSixteen(10, 20))")
        print("Exercise 17: \(exerciseSeventeen(10, 20))")
        print("Exercise 18: \(exerciseEighteen(10, 20))")
        print("Exercise 19: \(exerciseNineteen("Dinh Ngoc Vu"))")
        print("Exercise 20: \(exerciseTwenty("Dinh Ngoc Vu"))")
        print("Exercise 21: \(exerciseTwentyOne("Dinh Ngoc Vu"))")
        print("Exercise 22: \(exerciseTwentyTwo([2,3,4,5,2,3,7,7,7]))")
        print("Exercise 23: \(exerciseTwentyThree([2,3,4,5,2,3,7,7,7]))")
        print("Exercise 24: \(exerciseTwentyFour([1,2,3,4,1,2,2,1,2]))")
        print("Exercise 25: \(exerciseTwentyFive("atran van a"))")
        print("Exercise 26: \(exerciseTwentySix("atran van a"))")
        print("Exercise 27: \(exerciseTwentySeven([7,7]))")
        print("Exercise 28: \(exerciseTwentyEight([1,2,2,1,1,2,2,2]))")
    }
    
    func exerciseOne(_ numberOne: Int, _ numberTwo: Int) -> Int {
        var sum: Int
        if numberOne != numberTwo {
            sum = numberOne + numberTwo
            return sum
        }else {
            sum = 6 * numberOne
            return sum
        }
    }
    
    func exerciseTwo(_ n: Int) -> Int {
        if n < 51 {
            return (51 - n)
        } else {
            return (n - 51) * 2
        }
    }
    
    func exerciseThree(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if numberOne == 20 {
            return true
        } else if numberTwo == 20 {
            return true
        } else if (numberOne + numberTwo) == 20 {
            return true
        } else {
            return false
        }
    }
    
    func exerciseFour(_ numberOne: Int, _ numberTwo: Int) -> Bool{
        let value: Int = numberOne * numberTwo
        if value < 0 {
            return true
        } else {
            let sum: Int = numberOne + numberTwo
            if sum < 0 {
                return true
            } else {
                return false
            }
        }
    }
    
    func exerciseFive(_ chuoiString: String) -> String {
        if chuoiString.prefix(2) == "ls" {
            return chuoiString
        }else{
            let newString = "ls" + chuoiString
            return newString
        }
    }

    func exerciseSix(_ myString: String, _ i: Int) -> String {
        if myString.count < 1 {
            return "Pls input string more than one character"
        }
        
        if i < 0 || i > myString.count {
            return "Pls input index both in range 0..\(myString.count - 1)"
        }
        
        var newString: String = myString
        let index: String.Index = String.Index.init(encodedOffset: i)
        newString.remove(at: index)
        return newString
    }
    
    func exerciseSeven(_ mString: String, _ firstChar: String, _ lastChar: String) -> String {
        var newString = mString;
        newString = String(newString.dropFirst())
        newString = String(newString.dropLast())
        newString = firstChar + newString
        newString = newString + lastChar
        return newString
    }
    
    func exerciseEight(_ mString: String) -> String {
        var newString:String = mString
        
        if newString.count < 1 || newString == " " {
            print("Pls input string more than or equal to one character!")
            return mString
        } else {
            let mChar: Character = Array(newString)[newString.count - 1]
            newString = String(mChar) + newString
            newString = newString + String(mChar)
            return newString
        }
    }
    
    func exerciseNine(_ mNumber: Int) -> Bool {
        if mNumber < 0 {
            print("Pls input non-negative number!")
            return false
        }
        
        if mNumber % 3 == 0 || mNumber % 5 == 0 {
            return true
        } else {
            return false
        }
    }
    
    func exerciseTen(_ originString: String, _ copyString: String) -> String {
        if originString.count < 2 {
            return "Pls input string more than 1 character!"
        }
        
        let mChar:String = String(originString.prefix(2))
        let newString:String = mChar + copyString + mChar;
        return newString
    }
    
    func exerciseEleven(_ mString: String) -> Bool {
        if mString.count < 2 {
            return false
        }
        
        if mString.prefix(2) == "ls" {
            return true
        } else {
            return false
        }
    }
    
    func exerciseTwelve(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if numberOne > 10 && numberOne < 30 {
            return true
        } else if numberTwo > 10 && numberTwo < 30 {
            return true
        } else{
            return false
        }
    }
    
    func exerciseThirteen(_ mString: String) -> Bool {
        let mSub: String = String(String(mString.prefix(3)).dropFirst())
        
        if mSub == "ix" {
            return true
        } else {
            return false
        }
    }
    
    func exerciseFourteen(_ numberOne: Int, _ numberTwo: Int, _ numberThree: Int) -> Int {
        let arr = [numberOne, numberTwo, numberThree]
        var max: Int = arr[0]
        
        for i in 0..<(arr.count - 1) {
            if arr[i] < arr[i+1] {
                max = arr[i+1]
            }
        }
        
        return max
    }
    
    func exerciseFifteen(_ numberOne: Int, _ numberTwo: Int) -> Int {
        let distanceOne = 10 - numberOne
        let distenceTwo = 10 - numberTwo
        
        if distanceOne == distenceTwo {
            return 0
        }
        
        if abs(distanceOne) < abs(distenceTwo) {
            return numberOne
        } else {
            return numberTwo
        }
    }
    
    func exerciseSixteen(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if numberOne > 20 && numberOne < 30 && numberTwo > 20 && numberTwo < 30 {
            return true
        } else if numberOne > 30 && numberOne < 40 && numberTwo > 30 && numberTwo < 40 {
            return true
        } else {
            return false
        }
    }
    
    func exerciseSeventeen(_ numberOne: Int, _ numberTwo: Int) -> Int {
        var max: Int
        
        if numberOne > numberTwo {
            max = numberOne
        } else {
            max = numberTwo
        }
        
        if max >= 20 && max <= 30 {
            return max
        } else {
            return 0
        }
    }
    
    func exerciseEighteen(_ numberOne: Int, _ numberTwo: Int) -> Bool{
        if numberOne < 0 || numberTwo < 0 {
            print("Pls input two non-negative number!")
            return false
        }
        
        let numberOneLastDigit: Int = numberOne % 10
        let numberTwoLastDigit: Int = numberTwo % 10
        
        if numberOneLastDigit == numberTwoLastDigit {
            return true
        }
        else {
            return false
        }
    }
    
    func exerciseNineteen(_ mString: String) -> String {
        if mString.count < 3 {
            return mString.lowercased()
        }
        var newString: String = ""
        let index = mString.index(mString.endIndex, offsetBy: -3)
        let leftString = mString[..<index]
        let rightString = mString[index...]
        newString = leftString + rightString.uppercased()
        
        return newString
    }
    
    func exerciseTwenty(_ mString: String) -> Bool {
        if mString.count < 1 {
            //print("Pls input string more than or equal to one character")
            return false
        }
        
        let index = mString.index(of: "a")
        if index == nil {
            //print("Not found character a")
            return false
        }
        
        if mString[mString.index(after: index!)] == "a" {
            return true
        }
        else {
            return false
        }
    }
    
    func exerciseTwentyOne(_ mString: String) -> String {
        var newString:String = ""
        
        if mString.count < 1 {
            return "Pls input string more than 1 character!"
        }
        
        for i in stride(from: 0, to: mString.count, by: 2) {
            newString = newString + String(mString[String.Index.init(encodedOffset: i)])
        }
       
        return newString
    }
    
    func exerciseTwentyTwo(_ mArray: [Int]) -> Int {
        var count:Int = 0
        
        for i in mArray {
            if i == 7 {
                count += 1
            }
        }
        
        return count
    }
    
    func exerciseTwentyThree(_ mArray:[Int]) -> Bool {
        if mArray.count < 4{
            for i in 0...mArray.count {
                if mArray[i] == 7 {
                    return true
                }
            }
            return false
        } else {
            for i in 0...3 {
                if mArray[i] == 7 {
                    return true
                }
            }
            return false
        }
    }
    
    func exerciseTwentyFour(_ mArr: [Int]) -> Bool {
        for index in 0...mArr.count - 3 {
            if mArr[index] == 0 {
                if mArr[index + 1] == 1 && mArr[index + 2] == 2 {
                    return true
                } else {
                    
                }
            } else {
                
            }
        }
        
        return false
    }
    
    func exerciseTwentyFive(_ originString: String) -> String {
        var newString: String = ""
        for (index, item) in originString.enumerated() {
            if item == "a" && index != 0 && index != (originString.count - 1) {
                
            } else {
                newString.append(item)
            }
        }
        
        return newString
    }
    
    func exerciseTwentySix(_ originString: String) -> String {
        var newString: String = ""
        for index in stride(from: 0, to: originString.count, by: 2){
            newString.append(originString[String.Index.init(encodedOffset: index)])
        }
        
        return newString
    }
    
    func exerciseTwentySeven(_ originArray: [Int]) -> Int {
        var count: Int = 0
        
        for (index,item) in originArray.enumerated() {
            if index == originArray.count - 1 {
                break
            } else {
                if item == 7 && originArray[index + 1] == 7 {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func exerciseTwentyEight(_ originArray: [Int]) -> Bool {
        if originArray.count < 3 {
            return false
        } else {
            for (index, item) in originArray.enumerated() {
                if index == originArray.count - 2 {
                    // Exit the loop
                    break
                } else {
                    if item == originArray[index + 1] && item == originArray[index + 2] {
                        return true
                    } else {
                        // Continue the loop
                    }
                }
            }
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

