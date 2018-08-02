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
        lessionTwentyTwo([1,2,3,7,5,7,4,2,7])
    }
    
    func lessionOne(_ numberOne:Int, _ numberTwo:Int)
    {
        var sum:Int
        if numberOne != numberTwo {
            sum = numberOne + numberTwo
            print(sum)
        }else {
            sum = 3*numberOne
            print(sum)
        }
    }
    
    func lessionTwo(_ n:Int) -> Int{
        if n < 51 {
            return (51 - n)
        }else{
            return (n-51)*2
        }
    }
    
    func lessionThree(_ numberOne:Int, _ numberTwo:Int) -> Bool{
        if numberOne == 20 {
            return true
        }else if numberTwo == 20{
            return true
        }else if (numberOne + numberTwo) == 20{
            return true
        }else{
            return false
        }
    }
    
    func lessionFour(_ numberOne:Int, _ numberTwo:Int) -> Bool{
        let value:Int = numberOne * numberTwo
        if value < 0 {
            return true
        }else{
            let sum:Int = numberOne + numberTwo
            if sum < 0 {
                return true
            }else{
                return false
            }
        }
    }
    
    func lessionFive(_ chuoiString:String) -> String{
        if chuoiString.prefix(2) == "ls" {
            return chuoiString
        }else{
            let newString = "ls" + chuoiString
            return "New String: " + newString
        }
    }

    func lessionSix(_ myString:String, _ i:Int) -> String{
        if myString.count < 1 {
            return "Pls input string more than one character"
        }
        
        if i < 0 || i > myString.count {
            return "Pls input index both in range 0..\(myString.count - 1)"
        }
        
        var newString:String = myString
        let index:String.Index = String.Index.init(encodedOffset: i)
        newString.remove(at: index)
        return newString
    }
    
    func lessionSeven(_ mString:String, _ firstChar:String, _ lastChar:String) ->String{
        var newString = mString;
        newString = String(newString.dropFirst())
        newString = String(newString.dropLast())
        newString = firstChar + newString
        newString = newString + lastChar
        return newString
    }
    
    func lessionEight(_ mString:String) {
        var newString:String = mString
        
        if newString.count < 1 || newString == " " {
            print("Pls input string more than one character!")
        }else {
            let mChar:Character = Array(newString)[newString.count - 1]
            newString = String(mChar) + newString
            newString = newString + String(mChar)
            print(newString)
        }
    }
    
    func lessionNine(_ mNumber:Int) {
        if mNumber < 0 {
            print("Pls input non-negative number!")
            return
        }
        
        if mNumber % 3 == 0 && mNumber % 5 == 0 {
            print("This number is a multiple of 3 and 5")
        }else if mNumber % 3 == 0 {
            print("This number is a multiple of 3")
        }else if mNumber % 5 == 0 {
            print("This number is a multiple of 5")
        }else{
            print("None multiple")
        }
    }
    
    func lessionTen(_ mString:String) {
        if mString.count < 2 {
            print("Pls input string more than 1 character!")
            return
        }
        let mChar:String = String(mString.prefix(2))
        let newString:String = mChar + mString + mChar;
        print(newString)
    }
    
    func lessionEleven(_ mString:String) -> Bool {
        if mString.count < 2 {
            return false
        }
        
        if mString.prefix(2) == "ls" {
            return true
        }else {
            return false
        }
    }
    
    func lessionTwelve(_ numberOne:Int, _ numberTwo:Int) -> Bool {
        if numberOne > 10 && numberOne < 30 {
            return true
        }else if numberTwo > 10 && numberTwo < 30 {
            return true
        }else{
            return false
        }
    }
    
    func lessionThirteen(_ mString:String) -> Bool {
        let mSub:String = String(mString.prefix(3))
        
        if mSub == "fix" {
            return true
        }
        
        let mSub2 = String(mSub.dropFirst())
        
        if mSub2 == "ix" {
            return true
        }
        
        return false
    }
    
    func lessionFourteen(_ numberOne:Int, _ numberTwo:Int, _ numberThree:Int) {
        let arr = [numberOne, numberTwo, numberThree]
        var temp:Int = arr[0]
        var index:Int = 0
        for i in 0..<(arr.count - 1) {
            if arr[i] < arr[i+1] {
                temp = arr[i+1]
                index = i+1
            }
        }
        print("Largest number is \(temp) in index \(index)")
    }
    
    func lessionFifteen(_ numberOne:Int, _ numberTwo:Int) -> Int {
        let distanceOne = 10 - numberOne
        let distenceTwo = 10 - numberTwo
        
        if distanceOne == distenceTwo {
            return 0
        }
        
        if abs(distanceOne) < abs(distenceTwo){
            return numberOne
        }else{
            return numberTwo
        }
    }
    
    func lessionSixteen(_ numberOne:Int, _ numberTwo:Int) {
        if numberOne >= 20 && numberOne <= 30 && numberTwo >= 20 && numberTwo <= 30 {
            print("Number \(numberOne) & \(numberTwo) both 20..30")
        }
        else if numberOne >= 30 && numberOne <= 40 && numberTwo >= 30 && numberTwo <= 40 {
            print("Number \(numberOne) & \(numberTwo) both 30..40")
        }
        else {
            print("Number \(numberOne) & \(numberTwo) not both in range 20..30 and 30..40 ")
        }
    }
    
    func lessionSeventeen(_ numberOne:Int, _ numberTwo:Int) -> Int {
        var max:Int
        if numberOne > numberTwo {
            max = numberOne
        }
        else {
            max = numberTwo
        }
        
        if max >= 20 && max <= 30 {
            print("Larger number both in range 20..30")
            return max
        }
        else {
            return 0
        }
    }
    
    func lessionEighteen(_ numberOne:Int, _ numberTwo:Int) {
        if numberOne < 0 || numberTwo < 0 {
            print("Pls input two number non-negative")
            return
        }
        
        let numberOneLastDigit:Int = numberOne % 10
        let numberTwoLastDigit:Int = numberTwo % 10
        
        if numberOneLastDigit == numberTwoLastDigit {
            print("Last digit of two number are same")
        }
        else {
            print("Last digit of two number are not same")
        }
    }
    
    func lessionNineteen(_ mString:String) {
        if mString.count < 3 {
            print(mString.lowercased())
            return
        }
        
        let index = mString.index(mString.endIndex, offsetBy: -3)
        let leftString = mString[..<index]
        let rightString = mString[index...]
        let newString = leftString + rightString.uppercased()
        print("New String: " + newString)
    }
    
    func lessionTwenty(_ mString:String) {
        if mString.count < 1 {
            print("Pls input string greater than or equal to one character")
            return
        }
        
        let index = mString.index(of: "a")
        if index == nil {
            print("Not found character a")
            return
        }
        
        if mString[mString.index(after: index!)] == "a" {
            print("Found string aa")
        }
        else {
            print("Not found string aa")
        }
    }
    
    func lessionTwentyOne(_ mString:String) {
        var newString:String! = ""
        for i in stride(from: 0, to: mString.count, by: 2) {
            newString = newString + String(mString[String.Index.init(encodedOffset: i)])
        }
        print("NewString: " + newString)
    }
    
    func lessionTwentyTwo(_ mArray:[Int]) {
        var count:Int = 0
        for i in mArray {
            if i == 7 {
                count += 1
            }
        }
        print("Count the number of 7's: \(count)")
    }
    
    func lessionTwentyThree(_ mArray:[Int]) -> Bool {
        if mArray.count < 4{
            for i in 0...mArray.count {
                if mArray[i] == 7 {
                    return true
                }
            }
        }
        else {
            for i in 0...3 {
                if mArray[i] == 7 {
                    return true
                }
            }
        }
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

