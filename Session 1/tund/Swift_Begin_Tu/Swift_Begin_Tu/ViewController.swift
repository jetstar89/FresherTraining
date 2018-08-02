//
//  ViewController.swift
//  Swift_Begin_Tu
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("View did load")
        
//        exam28([1,56,7,7,8,8,8])
//        exam27([1,56,7,7])
//        exam26("Gem Company")
//        exam25("Gem Company")
//        exam24([0,1,2,56,7,7])
//        exam22([0,1,2,56,7,7])
//        exam21("Gem Company")
//        exam20("aaaaa")
//        exam17(2,3)
//        print(exam17(2,3))
//        exam16(30, 40)
//        exam15(10,14)
//        exam14(1,2,3)
//        print(exam14(1,2,3))
//        exam13("fiadsfads")
//        exam12(25,15)
//        exam11("Isasdfhasv")
//        exam10("Nguyen Dinh Tu")
//        exam9(35)
        exam8("Nguyen Dinh Tu")
//        exam7("sds","dsdsds")
//        print(exam7("sds","dsdsds"))
//        exam6("Nguyen Dinh Tu")
//        exam5("Nguyen Dinh Tu")
//        exam4(10,20)
//        exam3(10,20)
//        exam2(10)
//        exam1(10,20)
//
        print( exam23([0,1,2,56,7,7]))
        exam18(5,5)
        exam19("nguyen dinh tu")
        
        
        
        
    }
    
   
    
    
    
    func exam1(_ a: Int,_ b:Int){
        if (a != b){
            print("Tong 2 so la \(a + b)");
        } else {
            print("Tong 3 so \(3*a)");
        }
    }
    func exam2(_ number:Int) {
        if (number > 51){
            print("Gap doi so \(2*(number-51))");
        }
    }
    func exam3(_ a: Int, _ b:Int) -> Bool {
        if (a == 20 || b == 20 || (a + b) == 20){
            return true;
        }
        return false;
    }
    func exam4(_ a:Int,_ b:Int) -> Bool {
        if (a*b < 0 || (a < 0 && b < 0)){
            return true;
        }
        return false;
    }
    func exam5(_ str:String) -> String {
        if (str.prefix(2) != "Is"){
            return "Is" + str;
        }
        return str;
    }
    func exam6(_ str:String) -> String {
        let strNew:String = String(str.dropFirst());
        return strNew;
    }
    func exam7(_ str:String,_ strReplace:String) -> String {
        var strNew = str;
        strNew = String(strNew.dropFirst());
        strNew  = String(strNew .dropLast());
        strNew  = strNew + strReplace;
        strNew  = strReplace + strNew ;
        return strNew;
    }
    
    func exam8(_ str:String){
        var strAdd = str
        if strAdd.count < 1 || strAdd.isEmpty{
            print("Invalid Input (<1)")
        } else {
            strAdd = "\(strAdd.last!)" + strAdd
            strAdd.append(strAdd.last!)
        }
        print(strAdd)
    }
    func exam9(_ a:Int){
        if a<=0{
            print("Dau vao sai")
        }else if a%3==0 && a%5==0{
            print("\(a) la boi cua 3 va 5")
        }else if( a%3==0){
            print("\(a) la boi cua 3")
        }else if( a%5==0){
            print("\(a) la boi cua 5")
        }
    }
    func exam10(_ str:String)->String{
        let ch:String = String(str.prefix(2))
        var str1:String = "sadas"
        str1 = ch + str1 + ch
        return str1
    }
    
    func exam11(_ str:String)->Bool{
        var strAdd:String = ""
        if(str.count>=1){
            for i in 0..<str.count{
                let index = str.index(str.startIndex, offsetBy: i)
                if(i<2){
                    strAdd.append(str[index])
                }
            }
        }else{
            print("Day so qua ngan")
        }
        if(strAdd == "Is"){
            return true
        }
        return false
    }
    func exam12(_ a:Int, _ b:Int)-> Bool{
        if a>=20 || a<=30{
            return true
        }
        if b>=20 || b<=30{
            return true
        }
        return false
    }
    // bai nay con thieu truong hop nhung em chua quet dc het
    func exam13(_ str:String){
        var strAdd:String = ""
        if(str.count>=2){
            for i in 0..<str.count{
                let index = str.index(str.startIndex, offsetBy: i)
                if(i<3){
                    strAdd.append(str[index])
                }
            }
        }else{
            print("Day so qua ngan")
        }
        if(strAdd == "fix"){
            print("Day so co tu 'fix'  bat dau")
        }
        
    }
    func exam14(_ a:Int,_ b:Int, _ c:Int)->Int{
        var max:Int
        max = a
        if(max<b){
            max = b
        }
        if(max<c){
            max = c
        }
        return max
    }
    // bai nay em k search ra cach tim gia tri tuyet doi nen chi dung trong trong hop 2 so duong
    func exam15(_ a:Int,_ b:Int)->Int{
        var  e:Int = 0
        var d:Int = 0
        if(a>0&&b>0){
            e = a - 10
            d = b - 10
            if(e>d){
                print("\(b) gan 10 hon")
                 return 1
            }
            if(e<d){
                print("\(a) gan 10 hon")
                return 2
            }else{
                print("Hai so cung khoang cah voi 10")
                
            }
        }
        return 0
    }
    func exam16(_ a:Int, _ b:Int){
    
        if(a>=20||a<=30&&b>=20&&b<=30){
            print("Hai so nam trong khoang tu 20 den 30")
        }
        if(a>=30||a<=40&&b>=30&&b<=40){
            print("Hai so nam trong khoang tu 30 den 40")
        }
        
    }
    func exam17(_ a:Int, _ b:Int)->Int{
        var c:Int
        if(a<0||b<0){
            print("Invalid Input")
        }
        if(a>b){
                c=a
            }
                c=b
        if(c>=20){
            if(c<=30){
                return 1;
            }
            
        }
        return 0;
        
    }
    
    // 2 bai 18 19 em cung chua nghi ra
    
    func exam18(_ a:Int,_ b: Int){
        if(a<0 || b<0){
                print("\(a) hoac \(b) la so am")
        }else{
            var ch1:Character = "\(a)".last!
            var ch2:Character = "\(b)".last!
            if(ch1 == ch2){
                print("Hai so co gia tri cuoi giong nhau")
            }else{
                 print("Hai so co gia tri cuoi khac nhau")
            }
            
            
        }
    }

    
    func exam19(_ str:String){
        var strAdd:String = ""
        if(str.count<3){
            str.lowercased()
        }
        else{
            for i in 0..<str.count{
                let index = str.index(str.startIndex, offsetBy: i)
                
                if(i==str.count  || i == str.count-1 || i == str.count-2){
                    strAdd.append("\(str[index])".uppercased())
                }else{
                    strAdd.append(str[index])
                }
            }
        }
        print(strAdd)
    }
    func exam20(_ str:String){
        var count:Int = 0
        var ch:String = ""
        var ch1:String = ""
        for i in 0..<str.count{
            let index = str.index(str.startIndex, offsetBy: i)
            var ch = str[index]
            for j in i+1..<str.count{
                let index1 = str.index(str.startIndex, offsetBy: i)
                var ch1 = str[index1]
                if(ch == ch1){
                    count = 1
                }
                }
            }
        if count == 1{
            print("Chuoi dung dinh dang 'aa' theo yeu cau")
        }
        
    }
    func exam21(_ str:String){
        var strAdd = ""
        for i in 0..<str.count{
            let index = str.index(str.startIndex, offsetBy: i)
            var ch = str[index]
            
            strAdd.append(ch)
             
        }
        print(strAdd)
    }
    
    func exam22(_ arr:[Int]){
       
        var count:Int = 0
        for i in 0..<arr.count{
            if(arr[i]==7){
                count = count + 1
            }
        }
        print("So 7 xuat hien \(count) lan")
    }
    func exam23(){
        
    }
    // bai23 em khong nghi ra
    func exam23(_ arr:[Int])-> Bool{
        var count:Int = 0
        for i in 0..<arr.count {
            count = count + 1
            if(count == 4){
            
                break
            }
            if arr[i]==7 {
                return true
            }
            
        }
        return false
    }
    func exam24(_ arr:[Int]){
        
        var count:Int = 0
        var a:Int
        var b:Int
        var c:Int
        for i in 0..<arr.count{
            a = arr[i]
            for j in i+1..<arr.count{
                b = arr[j]
                for k in j+1..<arr.count{
                    c = arr[k]
                    if(a==0&&b==1&&c==2){
                        count = 1
                    }
                }
            }
        }
        if(count==1){
            print("Chuoi so 0,1,2 co xuat hien trong day")
        }
        
    }
    func exam25(_ str:String){
        
        var strAdd = ""
        for i in 0..<str.count{
            let index = str.index(str.startIndex, offsetBy: i)
            var ch = str[index]
            if(i>0||i<str.count){
                if(ch != "a"){
                    strAdd.append(ch)
                }
            }
        }
        print(strAdd)
    }
    
    func exam26(_ str:String){
        var strAdd = ""
        
        for i in 0..<str.count{
            if(i % 2 == 0){
                  let index = str.index(str.startIndex, offsetBy: i)
                strAdd.append(str[index])
            }
        }
        print(strAdd)
        
    }
    func exam27(_ arr:[Int]){
        
        var count:Int = 0
        var a:Int
        var b:Int
        for i in 0..<arr.count{
            a = arr[i]
            for j in i+1..<arr.count{
                b = arr[j]
                if (a==b&&a==7){
                    count = count + 1
                }
            }
        }
        print(count)
    }
    func exam28(_ arr:[Int]){
        let input:Int = 8
        var count:Int = 0
        for i in 0..<arr.count{
            if(input==arr[i]){
                count = count + 1
            }
        }

        if(count == 3){
            print("So co hien thi 3 lan trong day")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

