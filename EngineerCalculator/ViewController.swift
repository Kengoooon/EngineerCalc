//
//  ViewController.swift
//  EngineerCalculator
//
//  Created by 藤本健悟 on 2016/12/18.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hexbutton: UIButton!
    @IBOutlet weak var decbutton: UIButton!
    @IBOutlet weak var octbutton: UIButton!
    @IBOutlet weak var binbutton: UIButton!
    @IBOutlet weak var hexlabel: UILabel!
    @IBOutlet weak var declabel: UILabel!
    @IBOutlet weak var octlabel: UILabel!
    @IBOutlet weak var binlabel: UILabel!
    @IBOutlet weak var Abutton: UIButton!
    @IBOutlet weak var Bbutton: UIButton!
    @IBOutlet weak var Cbutton: UIButton!
    @IBOutlet weak var Dbutton: UIButton!
    @IBOutlet weak var Ebutton: UIButton!
    @IBOutlet weak var Fbutton: UIButton!
    @IBOutlet weak var zerobutton: UIButton!
    @IBOutlet weak var onebutton: UIButton!
    @IBOutlet weak var twobutton: UIButton!
    @IBOutlet weak var threebutton: UIButton!
    @IBOutlet weak var fourbutton: UIButton!
    @IBOutlet weak var fivebutton: UIButton!
    @IBOutlet weak var sixbutton: UIButton!
    @IBOutlet weak var sevenbutton: UIButton!
    @IBOutlet weak var eightbutton: UIButton!
    @IBOutlet weak var ninebutton: UIButton!
    
    var inputflag:Int = 0
    var hex:String = ""
    var dec:String = ""
    var oct:String = ""
    var bin:String = ""
    var count:Int = 0
    var opeFlg:Int = 0
    var firstFlg:Int = 0
    var errorFlg:Int = 0
    
    //合計を保持する変数
    var sum:Float64 = 0
    var convresult:String = ""
    
    //演算子を保持する変数
    var ope:String = ""
    
    //入力結果を保持する変数
    var result:String = ""
    
    //計算関数
    func calc(input:String) -> (){
        switch inputflag {
        case 2:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
                result = dectobin(num: String(format:"%g",sum))
                binlabel.text = result
                bin = result
                frombin()
            case "-":
                sum -= Float64(bintodec(num: input))!
                result = dectobin(num: String(format:"%g",sum))
                binlabel.text = result
                bin = result
                frombin()
            case "×":
                sum *= Float64(bintodec(num: input))!
                result = dectobin(num: String(format:"%g",sum))
                binlabel.text = result
                bin = result
                frombin()
            case "÷":
                sum /= Float64(bintodec(num: input))!
                result = dectobin(num: String(format:"%g",sum))
                binlabel.text = result
                bin = result
                frombin()
            case "":
                sum = Float64(bintodec(num: input))!
                result = dectobin(num: String(format:"%g",sum))
                binlabel.text = result
                firstFlg = 1
                bin = result
                frombin()
            default: break
            }
            return
        
        case 8:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
                result = dectooct(num: String(format:"%g",sum))
                octlabel.text = result
                oct = result
                fromoct()
            case "-":
                sum -= Float64(bintodec(num: input))!
                result = dectooct(num: String(format:"%g",sum))
                octlabel.text = result
                oct = result
                fromoct()
            case "×":
                sum *= Float64(bintodec(num: input))!
                result = dectooct(num: String(format:"%g",sum))
                octlabel.text = result
                oct = result
                fromoct()
            case "÷":
                sum /= Float64(bintodec(num: input))!
                result = dectooct(num: String(format:"%g",sum))
                octlabel.text = result
                oct = result
                fromoct()
            case "":
                sum = Float64(octtodec(num: input))!
                result = dectooct(num: String(format:"%g",sum))
                octlabel.text = result
                firstFlg = 1
                oct = result
                fromoct()
            default: break
            }
            return
            
        case 10:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
                result = String(format:"%g",sum)
                declabel.text = result
                dec = result
                fromDecimal()
            case "-":
                sum -= Float64(bintodec(num: input))!
                result = String(format:"%g",sum)
                declabel.text = result
                dec = result
                fromDecimal()
            case "×":
                sum *= Float64(bintodec(num :input))!
                result = String(format:"%g",sum)
                declabel.text = result
                dec = result
                fromDecimal()
            case "÷":
                sum /= Float64(bintodec(num: input))!
                result = String(format:"%g",sum)
                declabel.text = result
                dec = result
                fromDecimal()
            case "":
                sum = Float64(input)!
                result = String(format:"%g",sum)
                declabel.text = result
                dec = result
                firstFlg = 1
                fromDecimal()
                
            default: break
            }
            return

            
        case 16:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
                result = dectohex(num: String(format:"%g",sum))
                hexlabel.text = result
                hex = result
                fromhex()
            case "-":
                sum -= Float64(bintodec(num: input))!
                result = dectohex(num: String(format:"%g",sum))
                hexlabel.text = result
                hex = result
                fromhex()
            case "×":
                sum *= Float64(bintodec(num: input))!
                result = dectohex(num: String(format:"%g",sum))
                hexlabel.text = result
                hex = result
                fromhex()
            case "÷":
                sum /= Float64(bintodec(num: input))!
                result = dectohex(num: String(format:"%g",sum))
                hexlabel.text = result
                hex = result
                fromhex()
            case "":
                sum = Float64(hextodec(num: input))!
                result = dectohex(num: String(format:"%g",sum))
                hexlabel.text = result
                firstFlg = 1
                hex = result
                fromhex()
            default: break
            }
            return

        default:break
        }

    }
    
    func borderClear() -> (){
        hexbutton.layer.borderColor = UIColor.orange.cgColor
        decbutton.layer.borderColor = UIColor.orange.cgColor
        octbutton.layer.borderColor = UIColor.orange.cgColor
        binbutton.layer.borderColor = UIColor.orange.cgColor
    }
    
    func hexClear() -> (){
        Abutton.layer.backgroundColor = UIColor.black.cgColor
        Bbutton.layer.backgroundColor = UIColor.black.cgColor
        Cbutton.layer.backgroundColor = UIColor.black.cgColor
        Dbutton.layer.backgroundColor = UIColor.black.cgColor
        Ebutton.layer.backgroundColor = UIColor.black.cgColor
        Fbutton.layer.backgroundColor = UIColor.black.cgColor
    }
    func octClear() -> (){
        eightbutton.layer.backgroundColor = UIColor.black.cgColor
        ninebutton.layer.backgroundColor = UIColor.black.cgColor
     }

    func binClear() -> (){
        twobutton.layer.backgroundColor = UIColor.black.cgColor
        threebutton.layer.backgroundColor = UIColor.black.cgColor
        fourbutton.layer.backgroundColor = UIColor.black.cgColor
        fivebutton.layer.backgroundColor = UIColor.black.cgColor
        sixbutton.layer.backgroundColor = UIColor.black.cgColor
        sevenbutton.layer.backgroundColor = UIColor.black.cgColor
        eightbutton.layer.backgroundColor = UIColor.black.cgColor
        ninebutton.layer.backgroundColor = UIColor.black.cgColor
    }
    func backgroundreset() -> (){
        twobutton.layer.backgroundColor = UIColor.lightGray.cgColor
        threebutton.layer.backgroundColor = UIColor.lightGray.cgColor
        fourbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        fivebutton.layer.backgroundColor = UIColor.lightGray.cgColor
        sixbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        sevenbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        eightbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        ninebutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Abutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Bbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Cbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Dbutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Ebutton.layer.backgroundColor = UIColor.lightGray.cgColor
        Fbutton.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    func Clear() -> (){
        hex = ""
        dec = ""
        oct = ""
        bin = ""
        sum = 0
        ope = ""
        result = ""
        hexlabel.text = "0"
        declabel.text = "0"
        octlabel.text = "0"
        binlabel.text = "0"
        inputflag = 0
    }
    
    //演算子フラグをクリアする関数
    func flgClear() -> (){
        opeFlg = 0
        firstFlg = 0
        errorFlg = 0
    }
    
    //10進数から16進数への変換
    func dectohex(num:String) -> String{
        var i:Int = 0
        i = Int(num)!
        result = String(i,radix:16)
        return result
    }
    //10進数から8進数への変換
    func dectooct(num:String) -> String{
        var i:Int = 0
        i = Int(num)!
        result = String(i,radix:8)
        return result
    }
    //10進数から2進数への変換
    func dectobin(num:String) -> String{
        var i:Int = 0
        i = Int(num)!
        result = String(i,radix:2)
        return result
    }

    //10進数(Decに入力した際の他の進数表示関数)
    func fromDecimal() -> (){
        hexlabel.text = dectohex(num: dec)
        octlabel.text = dectooct(num: dec)
        binlabel.text = dectobin(num: dec)
    }
    //16進数文字を10進数文字へ変換
    func convhextodec(input:String) -> String{
        switch input{
            case "0":
            result = "0"
            case "1":
            result = "1"
            case "2":
            result = "2"
            case "3":
            result = "3"
            case "4":
            result = "4"
            case "5":
            result = "5"
            case "6":
            result = "6"
            case "7":
            result = "7"
            case "8":
            result = "8"
            case "9":
            result = "9"
            case "A":
            result = "10"
            case "B":
            result = "11"
            case "C":
            result = "12"
            case "D":
            result = "13"
            case "E":
            result = "14"
            case "F":
            result = "15"
            case "a":
            result = "10"
            case "b":
            result = "11"
            case "c":
            result = "12"
            case "d":
            result = "13"
            case "e":
            result = "14"
            case "f":
            result = "15"
            default:break
        }
        return result
    }
    
    
    //16進数を10進数へ変換
    func hextodec(num:String) -> String{
        var convsum:Int = 0
        var power:Int = 0
        count = num.characters.count
        for i in 0..<count{
            power = Int(pow(16,Double(i)))
            print(num)
            convsum += Int(convhextodec(input:(num.substring(with: num.index(num.startIndex,offsetBy: count-i-1)..<num.index(num.endIndex,offsetBy:-i)))))! * power
        }
        convresult = String(convsum)
        return convresult
    }
    
    func fromhex() -> (){
        declabel.text = hextodec(num: hex)
        octlabel.text = dectooct(num: hextodec(num: hex))
        binlabel.text = dectobin(num: hextodec(num: hex))
    }
    
    //2進数を10進数へ変換
    func bintodec(num:String) -> String{
        var convsum:Int = 0
        var power:Int = 0
        count = num.characters.count
        for i in 0..<count{
            power = Int(pow(2,Double(i)))
            convsum += Int(num.substring(with: num.index(num.startIndex,offsetBy: count-i-1)..<num.index(num.endIndex,offsetBy:-i)))! * power
        }
        convresult = String(convsum)
        return convresult
    }
    
    func frombin() -> (){
        declabel.text = bintodec(num: bin)
        octlabel.text = dectooct(num: bintodec(num: bin))
        hexlabel.text = dectohex(num: bintodec(num: bin))
    }
    
    //8進数を10進数へ変換
    func octtodec(num:String) -> String{
        var sum:Int = 0
        var power:Int = 0
        count = num.characters.count
        for i in 0..<count{
            power = Int(pow(8,Double(i)))
            sum += Int(num.substring(with: num.index(num.startIndex,offsetBy: count-i-1)..<num.index(num.endIndex,offsetBy:-i)))! * power
        }
        result = String(sum)
        return result
    }
    
    func fromoct() -> (){
        declabel.text = octtodec(num: oct)
        hexlabel.text = dectohex(num: octtodec(num: oct))
        binlabel.text = dectobin(num: octtodec(num: oct))
    }
    
    @IBAction func hexbutton(_ sender: UIButton) {
        backgroundreset()
        Clear()
        flgClear()
        borderClear()
        inputflag = 16
        hexbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func decbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        Clear()
        flgClear()
        inputflag = 10
        decbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func octbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        octClear()
        Clear()
        flgClear()
        inputflag = 8
        octbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func binbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        binClear()
        Clear()
        flgClear()
        inputflag = 2
        binbutton.layer.borderColor = UIColor.red.cgColor
    }

    
    
    @IBAction func Abutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "A"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "A"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    @IBAction func Bbutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "B"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "B"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    @IBAction func Cbutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "C"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "C"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    @IBAction func Dbutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "D"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "D"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    @IBAction func Ebutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "E"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "E"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    @IBAction func Fbutton(_ sender: UIButton) {
        if inputflag == 16{
            if opeFlg == 0{
                hex += "F"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "F"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        }
    }
    
    @IBAction func zerobutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                bin += "0"
                binlabel.text = bin
                frombin()
            }else{
                bin = "0"
                binlabel.text = bin
                frombin()
                flgClear()
            }
        case 8:
            if opeFlg == 0{
                oct += "0"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "0"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "0"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "0"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "0"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "0"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func onebutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                bin += "1"
                binlabel.text = bin
                frombin()
            }else{
                bin = "1"
                binlabel.text = bin
                frombin()
                flgClear()
            }
        case 8:
            if opeFlg == 0{
                oct += "1"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "1"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "1"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "1"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "1"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "1"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func twobutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "2"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "2"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "2"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "2"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "2"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "2"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func threebutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "3"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "3"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "3"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "3"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "3"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "3"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func fourbutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "4"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "4"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "4"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "4"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "4"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "4"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func fivebutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "5"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "5"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "5"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "5"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "5"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "5"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func sixbutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "6"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "6"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "6"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "6"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "6"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "6"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func sevenbutton(_ sender: UIButton) {
        switch inputflag {
        case 8:
            if opeFlg == 0{
                oct += "7"
                octlabel.text = oct
                fromoct()
            }else{
                oct = "7"
                octlabel.text = oct
                fromoct()
                flgClear()
            }
        case 10:
            if opeFlg == 0{
                dec += "7"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "7"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "7"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "7"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func eightbutton(_ sender: UIButton) {
        switch inputflag {
        case 10:
            if opeFlg == 0{
                dec += "8"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "8"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "8"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "8"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    @IBAction func ninebutton(_ sender: UIButton) {
        switch inputflag {
        case 10:
            if opeFlg == 0{
                dec += "9"
                declabel.text = dec
                fromDecimal()
            }else{
                dec = "9"
                declabel.text = dec
                fromDecimal()
                flgClear()
            }
        case 16:
            if opeFlg == 0{
                hex += "9"
                hexlabel.text = hex
                fromhex()
            }else{
                hex = "9"
                hexlabel.text = hex
                fromhex()
                flgClear()
            }
        default:break
        }
    }
    
    @IBAction func AdditionButton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                calc(input: bin)
                ope = "+"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "+"
            }
            
        case 8:
            if opeFlg == 0{
                calc(input: oct)
                ope = "+"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "+"
            }
            
        case 10:
            if opeFlg == 0{
                calc(input: dec)
                ope = "+"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "+"
            }
            
        case 16:
            if opeFlg == 0{
                calc(input: hex)
                ope = "+"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "+"
            }
            
        default:break
        }
    }

    @IBAction func SubtractionButton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                calc(input: bin)
                ope = "-"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "-"
            }
            
        case 8:
            if opeFlg == 0{
                calc(input: oct)
                ope = "-"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "-"
            }
            
        case 10:
            if opeFlg == 0{
                calc(input: dec)
                ope = "-"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "-"
            }
            
        case 16:
            if opeFlg == 0{
                calc(input: hex)
                ope = "-"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "-"
            }
            
        default:break
        }
    }
    @IBAction func multiplicationButton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                calc(input: bin)
                ope = "×"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "×"
            }
            
        case 8:
            if opeFlg == 0{
                calc(input: oct)
                ope = "×"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "×"
            }
            
        case 10:
            if opeFlg == 0{
                calc(input: dec)
                ope = "×"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "×"
            }
            
        case 16:
            if opeFlg == 0{
                calc(input: hex)
                ope = "×"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "×"
            }
            
        default:break
        }

        
    }
    @IBAction func DivisionButton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            if opeFlg == 0{
                calc(input: bin)
                ope = "÷"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "÷"
            }
            
        case 8:
            if opeFlg == 0{
                calc(input: oct)
                ope = "÷"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "÷"
            }
            
        case 10:
            if opeFlg == 0{
                calc(input: dec)
                ope = "÷"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "÷"
            }
            
        case 16:
            if opeFlg == 0{
                calc(input: hex)
                ope = "÷"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "÷"
            }
            
        default:break
        }
        
    }
    
    @IBAction func equalbutton(_ sender: UIButton) {
        
        if ope == "÷" && result == "0"{
            binlabel.text = "エラー"
            declabel.text = "エラー"
            octlabel.text = "エラー"
            hexlabel.text = "エラー"
        }else{
            calc(input: result)
            opeFlg = 1
        }
    }
    
    @IBAction func clearbutton(_ sender: UIButton) {
        Clear()
        flgClear()
        borderClear()
    }
    @IBAction func allclearbutton(_ sender: UIButton) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

