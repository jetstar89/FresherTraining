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

