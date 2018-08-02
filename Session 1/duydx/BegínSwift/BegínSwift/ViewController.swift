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
        let str:String = "aaaDuyba";
        let arr:Array<Int> = [2,7,7,7,6,0,1,2];
        lessonOne(numberOne, numberTwo);
        lessonTwo(numberOne);
        print(lessonThree(numberOne, numberTwo));
        print(lessonFour(numberOne, numberTwo));
        print(lessonFive(str));
        print(lessonSix(str));
        print(lessonSeven(str,"Duy" ));
        print(lessonEight(str));
        lessonNine(numberOne);
        print(lessonTen(str));
        print(lessonElevent(str))
        print(lesonTwelfth(numberOne, numberTwo));
        print(lessonThreteen(str));
        print(lessonFourteen(numberOne, numberTwo, numberThree));
        print(lessonFifteen(numberOne, numberTwo));
        print(lessSixteen(numberOne, numberTwo));
        print(lessonSeventeen(numberOne, numberTwo));
        print(lessonEightteen(numberOne, numberTwo));
        print(lessonNineteen(str));
        print(lessonTwentytwo(arr));
        print(lessonTwentythree(arr));
        print(lessonTwentyfour(arr));
        lessonTwentysix(str);
        lessonTwentySeven(arr);
    }
    func lessonTwentythree(_ arr:Array<Int>) -> Bool {
        for index in 0..<arr.count{
            if arr[index] == 4{
                return true;
            }
            if index == 4 {
                return false;
            }
        }
        return false;
    }
    func lessonTwentysix(_ str:String){
        var newString:String! = "";
        for index in stride(from: 0, to: str.count, by: 2){
            newString = newString + String(str[String.Index.init(encodedOffset: index)]);
        }
        print("New string: " + newString);
    }
    func lessonTwentySeven(_ arr:Array<Int>) {
        var count:Int = 0;
        for index in 0..<arr.count{
            if arr[index] == 7 && arr[index + 1] == 7 {
                count = count + 1;
            }
        }
        print("Số lần số 7 cạnh nhau: \(count)");
    }
    func lessonTwentyfour(_ arr:Array<Int>) -> Bool {
        for index in 0..<arr.count-2{
            if arr[index] == 0 && arr[index + 1] == 1 && arr[index + 2] == 2{
                return true;
            }
        }
        return false;
    }
    func lessonTwentytwo(_ arr:Array<Int>) -> Int {
        var count = 0;
        for index in 0..<arr.count {
            if arr[index] == 7 {
                count = count + 1;
            }
        }
        return count;
    }
    func lessonNineteen(_ str: String) -> String {
        var newString:String = str;
        if newString.count < 3 {
            newString = newString.lowercased();
        } else {
            let index = newString.index(newString.startIndex, offsetBy: newString.count - 3);
            newString[index...];
            var strLast:String = String(newString.suffix(from: index));
            strLast = String(strLast.uppercased());
            newString[...index];
            newString = String(newString.prefix(upTo: index));
            newString = newString + strLast;
        }
        return newString;
    }
    func lessonEightteen(_ numberOne: Int, _ numberTwo:Int) -> Bool {
        if numberOne % 10 == numberTwo % 10{
            return true;
        }
        return false;
    }
    func lessonSeventeen(_ numberOne:Int, _ numberTwo:Int) -> Int {
        let max = numberOne > numberTwo ? numberOne : numberTwo;
        if max > 20 && max < 30{
            return max;
        }
        return 0;
    }
    func lessSixteen(_ numberOne:Int, _ numberTwo: Int) -> Bool {
        if (numberOne > 20 && numberOne < 30) && (numberTwo > 20 || numberTwo < 30){
            return true;
        }
        if (numberOne > 30 && numberOne < 40) && (numberTwo > 30 || numberTwo < 40){
            return true;
        }
        return false;
    }
    func lessonFifteen(_ numberOne: Int, _ numberTwo:Int) -> Int {
        let distanceOne:Int = abs(numberOne - 10);
        let disstanceTwo:Int = abs(numberTwo - 10);
        if distanceOne == disstanceTwo{
            return 0;
        }
        return distanceOne > disstanceTwo ? distanceOne : disstanceTwo;
    }
    func lessonFourteen(_ numberOne:Int, _ numberTwo:Int, _ numberThree:Int) -> Int {
        let numberTemp:Int = numberOne > numberTwo ? numberOne : numberTwo;
        return numberTemp > numberThree ? numberTemp : numberThree;
    }
    func lessonThreteen(_ str:String) -> Bool {
        let subStr = String(str.prefix(3));
        
        if (subStr.isEqual("fix")){
            return true;
        }
        if String(subStr.dropFirst()).isEqual("ix"){
            return true;
        }
        return false;
    }
    func lesonTwelfth(_ numberOne:Int, _ numberTwo:Int) -> Bool {
        if (numberOne > 10 && numberOne < 30) || (numberTwo > 10 || numberTwo < 30){
            return true;
        }
        return false;
    }
    func lessonElevent(_ str:String) -> Bool {
        if (String(str.prefix(2)).isEqual("Is")){
            return true;
        }
        return false;
    }
    func lessonTen(_ str:String) -> String {
        let charFirs:String = String(str.prefix(2));
        var newString:String = str;
        newString = charFirs + newString + charFirs;
        return newString;
    }
    func lessonNine(_ number: Int) {
        if number <= 0{
            print("Số không thoả mãn không âm");
        } else if number % 3 == 0 && number % 5 == 0{
            print("Số \(number) là bội số của 3 và 5");
        } else if number % 3 == 0{
            print("Số \(number) là bội số của 3");
        } else if number % 5  == 0 {
            print("Số \(number) là bội số của 5");
        }
    }
    func lessonEight(_ str:String) ->  String {
        var strS = str;
        if strS.count < 1 || strS.isEmpty{
            return "Nhập nhiều hơn 1 kí tự";
        } else {
            let subString:String = String(Array(strS)[strS.count - 1]);
            strS = subString + strS;
            return strS;
        }
    }
    func lessonSeven(_ str:String,_ strReplace:String) -> String {
        var newString = str;
        newString = String(newString.dropFirst());
        newString = String(newString.dropLast());
        newString = newString + strReplace;
        newString = strReplace + newString;
        return newString;
    }
    func lessonSix(_ str:String) -> String {
        let strRemove:String = String(str.dropFirst());
        return strRemove;
    }
    func lessonFour(_ numberOne:Int,_ numberTwo:Int) -> Bool {
        if (numberOne*numberTwo < 0 || (numberOne < 0 && numberTwo < 0)){
            return true;
        }
        return false;
    }
    func lessonThree(_ numberOne: Int, _ numberTwo:Int) -> Bool {
        if (numberOne == 20 || numberTwo == 20 || (numberOne + numberTwo) == 20){
            return true;
        }
        return false;
    }
    func lessonOne(_ numberOne: Int,_ numberTwo:Int){
        if (numberOne != numberTwo){
            print("Tổng của 2 số \(numberTwo + numberOne)");
        } else {
            print("Tổng của 3 số \(3*numberOne)");
        }
    }
    func lessonTwo(_ number:Int) {
        if (number > 51){
            print("Gấp đôi số lần: \(2*(number-51))");
        }
    }
    func lessonFive(_ str:String) -> String {
        if (str.prefix(2) != "Is"){
            return "Is" + str;
        }
        return str;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

