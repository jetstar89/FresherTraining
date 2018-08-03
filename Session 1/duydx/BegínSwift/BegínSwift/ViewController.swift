//
//  ViewController.swift
//  BegínSwift
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let numberOne:Int = 10;
        let numberTwo:Int = 12;
        let numberThree:Int = 20;
        let str:String = "Duy IoT";
        let arr:Array<Int> = [2,7,7,2,6,7,7,7];
        print("Exercise 1: \(exerciseOne(numberOne, numberTwo))")
        print("Exercise 2: \(exerciseTwo(numberOne))")
        print("Exercise 3: \(exerciseThree(numberOne, numberTwo))")
        print("Exercise 4: \(exerciseFour(numberOne, numberTwo))")
        print("Exercise 5: \(exerciseFive(str))")
        print("Exercise 6: \(exerciseSix(str))")
        print("Exercise 7: \(exerciseSeven(str,"Duy" ))")
        print("Exercise 8: \(exerciseEight(str))")
        let number: Int  = exerciseNine(numberOne)
        switch number {
        case 0:
            print("Exercise 9: Số không thoả mãn")
            break
        case 1:
            print("Exercise 9: Số là bội của 3 và 5")
            break
        case 2:
            print("Exercise 9: Số là bội của 3")
            break
        case 3:
            print("Exercise 9: Số là bội của 5")
            break
        default:
            break
        }
        print("Exercise 10: \(exerciseTen(str))")
        print("Exercise 11: \(exerciseElevent(str))")
        print("Exercise 12: \(exerciseTwelfth(numberOne, numberTwo))")
        print("Exercise 13: \(exerciseThreteen(str))")
        print("Exercise 14: \(exerciseFourteen(numberOne, numberTwo, numberThree))")
        print("Exercise 15: \(exerciseFifteen(numberOne, numberTwo))")
        print("Exercise 16: \(exerciseSixteen(numberOne, numberTwo))")
        print("Exercise 17: \(exerciseSeventeen(numberOne, numberTwo))")
        print("Exercise 18: \(exerciseEightteen(numberOne, numberTwo))")
        print("Exercise 19: \(exerciseNineteen(str))")
        print("Exercise 20: \(exerciseTwenty(str))")
        print("Exercise 21: \(exerciseTwentyOne(str))")
        print("Exercise 22: \(exerciseTwentyTwo(arr))")
        print("Exercise 23: \(exerciseTwentyThree(arr))")
        print("Exercise 24: \(exerciseTwentyFour(arr))")
        print("Exercise 25: \(exerciseTwentyFive(str))")
        print("Exercise 26: \(exerciseTwentySix(str))")
        print("Exercise 27: \(exerciseTwentySeven(arr))")
        print("Exercise 28: \(exerciseTwentyEgight(arr))")
    }
    func exerciseTwenty(_ str: String) -> Bool {
        for index in 0..<str.count {
            if str[String.Index.init(encodedOffset: index)] == "a" {
                if str[String.Index.init(encodedOffset: index + 1 )] == "a" {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
    func exerciseTwentyOne(_ str: String) -> String {
        var newString: String = ""
        for index in stride(from: 0, to: str.count, by: 2) {
            newString = newString + String(str[String.Index.init(encodedOffset: index)])
        }
        return newString
    }
    func exerciseTwentyFive(_ str: String) -> String {
        var newString: String = ""
        newString.append(str[String.Index.init(encodedOffset: 0)])
        for index in 1..<str.count - 1 {
            if str[String.Index.init(encodedOffset: index)] != "a" {
                newString.append(str[String.Index.init(encodedOffset: index)])
            }
        }
        newString.append(str[String.Index.init(encodedOffset: str.count - 1)])
        return newString
    }
    func exerciseTwentyEgight(_ arr: Array<Int>) -> Bool {
        if arr.count < 3 {
            return false
        } else {
            for index in 0..<arr.count - 2 {
                if arr[index] == arr[index + 1] && arr[index + 1] == arr[index + 2] {
                    return true
                }
            }
        }
        return false
    }
    func exerciseTwentyThree(_ arr: Array<Int>) -> Bool {
        for index in 0..<arr.count {
            if arr[index] == 4 {
                return true
            }
            if index == 4 {
                return false
            }
        }
        return false
    }
    func exerciseTwentySix(_ str: String) -> String {
        var newString: String = ""
        for index in stride(from: 0, to: str.count, by: 2) {
            newString = newString + String(str[String.Index.init(encodedOffset: index)])
        }
        return newString
    }
    func exerciseTwentySeven(_ arr: Array<Int>) -> Int {
        var count: Int = 0
        for index in 0..<arr.count - 1 {
            if arr[index] == 7 && arr[index + 1] == 7 {
                count = count + 1
            }
        }
        return count
    }
    func exerciseTwentyFour(_ arr: Array<Int>) -> Bool {
        for index in 0..<arr.count - 2 {
            if arr[index] == 0 && arr[index + 1] == 1 && arr[index + 2] == 2 {
                return true
            }
        }
        return false
    }
    func exerciseTwentyTwo(_ arr: Array<Int>) -> Int {
        var count = 0
        for index in 0..<arr.count {
            if arr[index] == 7 {
                count = count + 1
            }
        }
        return count
    }
    func exerciseNineteen(_ str: String) -> String {
        var newString: String = str
        if newString.count < 3 {
            newString = newString.lowercased()
        } else {
            let index = newString.index(newString.startIndex, offsetBy: newString.count - 3)
            newString[index...]
            var strLast: String = String(newString.suffix(from: index))
            strLast = String(strLast.uppercased())
            newString[...index]
            newString = String(newString.prefix(upTo: index))
            newString = newString + strLast
        }
        return newString
    }
    func exerciseEightteen(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if numberOne % 10 == numberTwo % 10 {
            return true
        }
        return false
    }
    func exerciseSeventeen(_ numberOne: Int, _ numberTwo: Int) -> Int {
        let max = numberOne > numberTwo ? numberOne : numberTwo
        if max > 20 && max < 30 {
            return max
        }
        return 0
    }
    func exerciseSixteen(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if numberOne > 20 && numberOne < 30 && numberTwo > 20 || numberTwo < 30 {
            return true
        } else if numberOne > 30 && numberOne < 40 && numberTwo > 30 || numberTwo < 40 {
            return true
        } else {
            return false
        }
    }
    func exerciseFifteen(_ numberOne: Int, _ numberTwo: Int) -> Int {
        let distanceOne: Int = abs(numberOne - 10)
        let disstanceTwo: Int = abs(numberTwo - 10)
        if distanceOne == disstanceTwo {
            return 0
        }
        return distanceOne > disstanceTwo ? distanceOne : disstanceTwo
    }
    func exerciseFourteen(_ numberOne: Int, _ numberTwo: Int, _ numberThree: Int) -> Int {
        let numberTemp: Int = numberOne > numberTwo ? numberOne : numberTwo
        return numberTemp > numberThree ? numberTemp : numberThree
    }
    func exerciseThreteen(_ str: String) -> Bool {
        let subStr = String(str.prefix(3))
        
        if subStr.isEqual("fix") {
            return true
        } else if String(subStr.dropFirst()).isEqual("ix") {
            return true
        } else {
            return false
        }
    }
    func exerciseTwelfth(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if (numberOne > 10 && numberOne < 30) || (numberTwo > 10 || numberTwo < 30) {
            return true
        }
        return false
    }
    func exerciseElevent(_ str: String) -> Bool {
        if String(str.prefix(2)).isEqual("Is") {
            return true
        }
        return false
    }
    func exerciseTen(_ str: String) -> String {
        let charFirs: String = String(str.prefix(2))
        var newString: String = str
        newString = charFirs + newString + charFirs
        return newString
    }
    func exerciseNine(_ number: Int) -> Int{
        if number <= 0 {
            return 0
        } else if number % 3 == 0 && number % 5 == 0 {
            return 1
        } else if number % 3 == 0 {
            return 2
        } else if number % 5  == 0 {
            return 3
        }
        return 0
    }
    func exerciseEight(_ str: String) ->  String {
        var strS = str
        if strS.count < 1 || strS.isEmpty {
            return "Nhập nhiều hơn 1 kí tự"
        } else {
            let subString: String = String(Array(strS)[strS.count - 1])
            strS = subString + strS
            return strS
        }
    }
    func exerciseSeven(_ str: String,_ strReplace: String) -> String {
        var newString = str
        newString = String(newString.dropFirst())
        newString = String(newString.dropLast())
        newString = newString + strReplace
        newString = strReplace + newString
        return newString
    }
    func exerciseSix(_ str: String) -> String {
        let strRemove: String = String(str.dropFirst())
        return strRemove
    }
    func exerciseFour(_ numberOne: Int,_ numberTwo: Int) -> Bool {
        if (numberOne*numberTwo < 0 || (numberOne < 0 && numberTwo < 0)) {
            return true
        }
        return false
    }
    func exerciseThree(_ numberOne: Int, _ numberTwo: Int) -> Bool {
        if (numberOne == 20 || numberTwo == 20 || (numberOne + numberTwo) == 20) {
            return true
        }
        return false
    }
    func exerciseOne(_ numberOne: Int,_ numberTwo: Int) -> Int {
        if (numberOne != numberTwo) {
            return numberOne + numberTwo
        } else {
            return 3 * numberOne
        }
    }
    func exerciseTwo(_ number: Int) -> Int{
        if (number > 51) {
            return 2 * (number - 51)
        } else {
            return 0
        }
    }
    func exerciseFive(_ str: String) -> String {
        if str.prefix(2) != "Is" {
            return "Is" + str
        }
        return str
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

