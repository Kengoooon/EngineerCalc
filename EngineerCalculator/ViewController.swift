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
    var result:String = ""
    var count:Int = 0
    
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
        hexlabel.text = "0"
        declabel.text = "0"
        octlabel.text = "0"
        binlabel.text = "0"
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
            default:break
        }
        return result
    }
    
    
    //16進数を10進数へ変換
    func hextodec(num:String) -> String{
        var sum:Int = 0
        var power:Int = 0
        count = num.characters.count
        for i in 0..<count{
            power = Int(pow(16,Double(i)))
            sum += Int(convhextodec(input:(num.substring(with: num.index(num.startIndex,offsetBy: i)..<num.index(num.endIndex,offsetBy:-count+i+1)))))! * power
        }
        result = String(sum)
        return result
    }
    
    func fromhex() -> (){
        declabel.text = hextodec(num: hex)
        octlabel.text = dectooct(num: hextodec(num: hex))
        binlabel.text = dectobin(num: hextodec(num: hex))
    }
    
    //2進数を10進数へ変換
    func bintodec(num:String) -> String{
        print(num)
        var sum:Int = 0
        var power:Int = 0
        count = num.characters.count
        for i in 0..<count{
            power = Int(pow(2,Double(i)))
            sum += Int(num.substring(with: num.index(num.startIndex,offsetBy: i)..<num.index(num.endIndex,offsetBy:-count+i+1)))! * power
            print(sum)
            print(power)
        }
        result = String(sum)
        return result
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
            sum += Int(num.substring(with: num.index(num.startIndex,offsetBy: i)..<num.index(num.endIndex,offsetBy:-count+i+1)))! * power
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
        inputflag = 16
        backgroundreset()
        Clear()
        borderClear()
        hexbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func decbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        Clear()
        inputflag = 10
        decbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func octbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        octClear()
        Clear()
        inputflag = 8
        octbutton.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func binbutton(_ sender: UIButton) {
        backgroundreset()
        borderClear()
        hexClear()
        binClear()
        Clear()
        inputflag = 2
        binbutton.layer.borderColor = UIColor.red.cgColor
    }

    
    
    @IBAction func Abutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "A"
            hexlabel.text = hex
            fromhex()
        }
    }
    @IBAction func Bbutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "B"
            hexlabel.text = hex
            fromhex()
        }
    }
    @IBAction func Cbutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "C"
            hexlabel.text = hex
            fromhex()
        }
    }
    @IBAction func Dbutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "D"
            hexlabel.text = hex
            fromhex()
        }
    }
    @IBAction func Ebutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "E"
            hexlabel.text = hex
            fromhex()
        }
    }
    @IBAction func Fbutton(_ sender: UIButton) {
        if inputflag == 16{
            hex += "F"
            hexlabel.text = hex
            fromhex()
        }
    }
    
    @IBAction func zerobutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "0"
            binlabel.text = bin
            declabel.text = bintodec(num: bin)
            frombin()
        case 8:
            oct += "0"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "0"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "0"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func onebutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "1"
            binlabel.text = bin
            declabel.text = bintodec(num: bin)
            frombin()
        case 8:
            oct += "1"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "1"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "1"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func twobutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "2"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "2"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "2"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "2"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func threebutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "3"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "3"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "3"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "3"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func fourbutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "4"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "4"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "4"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "4"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func fivebutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "5"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "5"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "5"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "5"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func sixbutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "6"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "6"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "6"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "6"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func sevenbutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "7"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "7"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "7"
            declabel.text = dec
        case 16:
            hex += "7"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func eightbutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "8"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "8"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "8"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "8"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func ninebutton(_ sender: UIButton) {
        switch inputflag {
        case 2:
            bin += "9"
            binlabel.text = bin
            frombin()
        case 8:
            oct += "9"
            octlabel.text = oct
            fromoct()
        case 10:
            dec += "9"
            declabel.text = dec
            fromDecimal()
        case 16:
            hex += "9"
            hexlabel.text = hex
            fromhex()
        default:break
        }
    }
    @IBAction func equalbutton(_ sender: UIButton) {
    }
    
    @IBAction func clearbutton(_ sender: UIButton) {
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

