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
    }
    
    func lessionOne(_ numberOne:Int, _ numberTwo:Int)
    {
        //Tính tổng hai số, nếu
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

