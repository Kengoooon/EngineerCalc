//
//  ViewController.swift
//  EngineerCalculator
//
//  Created by 藤本健悟 on 2016/12/18.
//  Copyright © 2016年 kengo. All rights reserved.
//

import UIKit
// import iAd
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate{
    
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
    
    let AdMobID = "[Your AdMob ID]"
    let TEST_ID = "ca-app-pub-6765299879929157~6777375272"
    
    let AdMobTest:Bool = true

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
        switch inputSource {
        case .bin:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
            case "-":
                sum -= Float64(bintodec(num: input))!
            case "×":
                sum *= Float64(bintodec(num: input))!
            case "÷":
                sum /= Float64(bintodec(num: input))!
            case "":
                sum = Float64(bintodec(num: input))!
                firstFlg = 1
            default: break
            }
            result = dectobin(num: String(format:"%g",floor(sum)))
            binlabel.text = result
            bin = result
            frombin()
            return

        case .oct:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
            case "-":
                sum -= Float64(bintodec(num: input))!
            case "×":
                sum *= Float64(bintodec(num: input))!
            case "÷":
                sum /= Float64(bintodec(num: input))!
            case "":
                sum = Float64(octtodec(num: input))!
                firstFlg = 1
            default: break
            }
            result = dectooct(num: String(format:"%g",floor(sum)))
            octlabel.text = result
            oct = result
            fromoct()
            return
            
        case .dec:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
            case "-":
                sum -= Float64(bintodec(num: input))!
            case "×":
                sum *= Float64(bintodec(num :input))!
            case "÷":
                sum /= Float64(bintodec(num: input))!
            case "":
                sum = Float64(input)!
                firstFlg = 1
            default: break
            }
            result = String(format:"%g",floor(sum))
            declabel.text = result
            dec = result
            fromDecimal()
            return
            
        case .hex:
            switch ope {
            case "+":
                sum += Float64(bintodec(num: input))!
            case "-":
                sum -= Float64(bintodec(num: input))!
            case "×":
                sum *= Float64(bintodec(num: input))!
            case "÷":
                sum /= Float64(bintodec(num: input))!
            case "":
                sum = Float64(hextodec(num: input))!
                firstFlg = 1
            default: break
            }
            result = dectohex(num: String(format:"%g",floor(sum)))
            hexlabel.text = result
            hex = result
            fromhex()
            return
        }
    }
    
    func borderClear() -> (){
        hexbutton.layer.borderColor = UIColor.black.cgColor
        decbutton.layer.borderColor = UIColor.black.cgColor
        octbutton.layer.borderColor = UIColor.black.cgColor
        binbutton.layer.borderColor = UIColor.black.cgColor
        hexlabel.layer.borderColor = UIColor.black.cgColor
        declabel.layer.borderColor = UIColor.black.cgColor
        octlabel.layer.borderColor = UIColor.black.cgColor
        binlabel.layer.borderColor = UIColor.black.cgColor
        hexbutton.layer.borderWidth = 0.5
        decbutton.layer.borderWidth = 0.5
        octbutton.layer.borderWidth = 0.5
        binbutton.layer.borderWidth = 0.5
        hexlabel.layer.borderWidth = 0.5
        declabel.layer.borderWidth = 0.5
        octlabel.layer.borderWidth = 0.5
        binlabel.layer.borderWidth = 0.5
    }
    
    func buttonClear() -> (){
        switch inputSource {
        case .hex:
            break
        case .dec:
            Abutton.layer.backgroundColor = UIColor.black.cgColor
            Bbutton.layer.backgroundColor = UIColor.black.cgColor
            Cbutton.layer.backgroundColor = UIColor.black.cgColor
            Dbutton.layer.backgroundColor = UIColor.black.cgColor
            Ebutton.layer.backgroundColor = UIColor.black.cgColor
            Fbutton.layer.backgroundColor = UIColor.black.cgColor
            Abutton.isUserInteractionEnabled = false
            Bbutton.isUserInteractionEnabled = false
            Cbutton.isUserInteractionEnabled = false
            Dbutton.isUserInteractionEnabled = false
            Ebutton.isUserInteractionEnabled = false
            Fbutton.isUserInteractionEnabled = false
        case .oct:
            Abutton.layer.backgroundColor = UIColor.black.cgColor
            Bbutton.layer.backgroundColor = UIColor.black.cgColor
            Cbutton.layer.backgroundColor = UIColor.black.cgColor
            Dbutton.layer.backgroundColor = UIColor.black.cgColor
            Ebutton.layer.backgroundColor = UIColor.black.cgColor
            Fbutton.layer.backgroundColor = UIColor.black.cgColor
            eightbutton.layer.backgroundColor = UIColor.black.cgColor
            ninebutton.layer.backgroundColor = UIColor.black.cgColor
            Abutton.isUserInteractionEnabled = false
            Bbutton.isUserInteractionEnabled = false
            Cbutton.isUserInteractionEnabled = false
            Dbutton.isUserInteractionEnabled = false
            Ebutton.isUserInteractionEnabled = false
            Fbutton.isUserInteractionEnabled = false
            eightbutton.isUserInteractionEnabled = false
            ninebutton.isUserInteractionEnabled = false
        case .bin:
            Abutton.layer.backgroundColor = UIColor.black.cgColor
            Bbutton.layer.backgroundColor = UIColor.black.cgColor
            Cbutton.layer.backgroundColor = UIColor.black.cgColor
            Dbutton.layer.backgroundColor = UIColor.black.cgColor
            Ebutton.layer.backgroundColor = UIColor.black.cgColor
            Fbutton.layer.backgroundColor = UIColor.black.cgColor
            twobutton.layer.backgroundColor = UIColor.black.cgColor
            threebutton.layer.backgroundColor = UIColor.black.cgColor
            fourbutton.layer.backgroundColor = UIColor.black.cgColor
            fivebutton.layer.backgroundColor = UIColor.black.cgColor
            sixbutton.layer.backgroundColor = UIColor.black.cgColor
            sevenbutton.layer.backgroundColor = UIColor.black.cgColor
            eightbutton.layer.backgroundColor = UIColor.black.cgColor
            ninebutton.layer.backgroundColor = UIColor.black.cgColor
            Abutton.isUserInteractionEnabled = false
            Bbutton.isUserInteractionEnabled = false
            Cbutton.isUserInteractionEnabled = false
            Dbutton.isUserInteractionEnabled = false
            Ebutton.isUserInteractionEnabled = false
            Fbutton.isUserInteractionEnabled = false
            eightbutton.isUserInteractionEnabled = false
            ninebutton.isUserInteractionEnabled = false
            twobutton.isUserInteractionEnabled = false
            threebutton.isUserInteractionEnabled = false
            fourbutton.isUserInteractionEnabled = false
            fivebutton.isUserInteractionEnabled = false
            sixbutton.isUserInteractionEnabled = false
            sevenbutton.isUserInteractionEnabled = false
        }
        
    }

    func backgroundreset() -> (){
        
        zerobutton.layer.backgroundColor = UIColor.lightGray.cgColor
        onebutton.layer.backgroundColor = UIColor.lightGray.cgColor
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
        Abutton.isUserInteractionEnabled = true
        Bbutton.isUserInteractionEnabled = true
        Cbutton.isUserInteractionEnabled = true
        Dbutton.isUserInteractionEnabled = true
        Ebutton.isUserInteractionEnabled = true
        Fbutton.isUserInteractionEnabled = true
        eightbutton.isUserInteractionEnabled = true
        ninebutton.isUserInteractionEnabled = true
        twobutton.isUserInteractionEnabled = true
        threebutton.isUserInteractionEnabled = true
        fourbutton.isUserInteractionEnabled = true
        fivebutton.isUserInteractionEnabled = true
        sixbutton.isUserInteractionEnabled = true
        sevenbutton.isUserInteractionEnabled = true
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
        inputSource = .hex
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
    
    enum InputSource {
        case hex
        case dec
        case oct
        case bin
    }
    //ラベルをタッチした際に枠線に色をつける関数
    func highlight(button: UIButton, label: UILabel, source: InputSource) {
        backgroundreset()
        Clear()
        flgClear()
        borderClear()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2;
        label.layer.borderColor = UIColor.red.cgColor
        inputSource = source
    }
    var inputSource: InputSource = .hex
    
    @IBAction func hexbutton(_ sender: UIButton) {
        highlight(button: hexbutton, label: hexlabel, source: .hex)
    }
    @IBAction func decbutton(_ sender: UIButton) {
        highlight(button: decbutton, label: declabel, source: .dec)
        buttonClear()
    }
    @IBAction func octbutton(_ sender: UIButton) {
        highlight(button: octbutton, label: octlabel, source: .oct)
        buttonClear()
    }
    @IBAction func binbutton(_ sender: UIButton) {
        highlight(button: binbutton, label: binlabel, source: .bin)
        buttonClear()
    }

    //ボタン入力関数
    func buttoninput(number: String){
        switch inputSource {
        case .hex:
            if hex.characters.count <= 7 {
                if opeFlg == 0 {
                    hex += number
                    hexlabel.text = hex
                    fromhex()
                }else{
                    hex = number
                    hexlabel.text = hex
                    fromhex()
                    flgClear()
                }
            }
        case .dec:
            if dec.characters.count <= 8 {
                if opeFlg == 0{
                    dec += number
                    declabel.text = dec
                    fromDecimal()
                }else{
                    dec = number
                    declabel.text = dec
                    fromDecimal()
                    flgClear()
                }
            }
        case .oct:
            if oct.characters.count <= 9 {
                if opeFlg == 0{
                    oct += number
                    octlabel.text = oct
                    fromoct()
                }else{
                    oct = number
                    octlabel.text = oct
                    fromoct()
                    flgClear()
                }
            }
        case .bin:
            if bin.characters.count <= 15 {
                if opeFlg == 0{
                    bin += number
                    binlabel.text = bin
                    frombin()
                }else{
                    bin = number
                    binlabel.text = bin
                    frombin()
                    flgClear()
                }
            }
        }
    }

    @IBAction func Abutton(_ sender: UIButton) {
        buttoninput(number: "A")
    }
    @IBAction func Bbutton(_ sender: UIButton) {
        buttoninput(number: "B")
    }
    @IBAction func Cbutton(_ sender: UIButton) {
        buttoninput(number: "C")
    }
    @IBAction func Dbutton(_ sender: UIButton) {
        buttoninput(number: "D")
    }
    @IBAction func Ebutton(_ sender: UIButton) {
        buttoninput(number: "E")
    }
    @IBAction func Fbutton(_ sender: UIButton) {
        buttoninput(number: "F")
    }
    @IBAction func zerobutton(_ sender: UIButton) {
        buttoninput(number: "0")
    }
    @IBAction func onebutton(_ sender: UIButton) {
        buttoninput(number: "1")
    }
    @IBAction func twobutton(_ sender: UIButton) {
        buttoninput(number: "2")
    }
    @IBAction func threebutton(_ sender: UIButton) {
        buttoninput(number: "3")
    }
    @IBAction func fourbutton(_ sender: UIButton) {
        buttoninput(number: "4")
    }
    @IBAction func fivebutton(_ sender: UIButton) {
        buttoninput(number: "5")
    }
    @IBAction func sixbutton(_ sender: UIButton) {
        buttoninput(number: "6")
    }
    @IBAction func sevenbutton(_ sender: UIButton) {
        buttoninput(number: "7")
    }
    @IBAction func eightbutton(_ sender: UIButton) {
        buttoninput(number: "8")
    }
    @IBAction func ninebutton(_ sender: UIButton) {
        buttoninput(number: "9")
    }

    enum OpeSource {
        case addition
        case substract
        case multiplication
        case division
    }
    var opeSource: OpeSource = .addition
    
    func opeButton(numbering:String) -> (){
        switch opeSource{
        case .addition:
            if opeFlg == 0{
                calc(input: numbering)
                ope = "+"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "+"
            }
        case .substract:
            if opeFlg == 0{
                calc(input: numbering)
                ope = "-"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "-"
            }
        case .multiplication:
            if opeFlg == 0{
                calc(input: numbering)
                ope = "×"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "×"
            }
        case .division:
            if opeFlg == 0{
                calc(input: numbering)
                ope = "÷"
                opeFlg = 1
            }else if opeFlg == 1{
                ope = "÷"
            }
            
        }
    }
    
    @IBAction func AdditionButton(_ sender: UIButton) {
        switch inputSource{
        case .bin:
            opeSource = .addition
            opeButton(numbering: bin)
        case .oct:
            opeSource = .addition
            opeButton(numbering: oct)
        case .dec:
            opeSource = .addition
            opeButton(numbering: dec)
        case .hex:
            opeSource = .addition
            opeButton(numbering: hex)
        }
    }

    @IBAction func SubtractionButton(_ sender: UIButton) {
        switch inputSource{
        case .bin:
            opeSource = .substract
            opeButton(numbering: bin)
        case .oct:
            opeSource = .substract
            opeButton(numbering: oct)
        case .dec:
            opeSource = .substract
            opeButton(numbering: dec)
        case .hex:
            opeSource = .substract
            opeButton(numbering: hex)
        }
    }
    @IBAction func multiplicationButton(_ sender: UIButton) {
        switch inputSource{
        case .bin:
            opeSource = .multiplication
            opeButton(numbering: bin)
        case .oct:
            opeSource = .multiplication
            opeButton(numbering: oct)
        case .dec:
            opeSource = .multiplication
            opeButton(numbering: dec)
        case .hex:
            opeSource = .multiplication
            opeButton(numbering: hex)
        }
    }
    @IBAction func DivisionButton(_ sender: UIButton) {
        switch inputSource{
        case .bin:
            opeSource = .division
            opeButton(numbering: bin)
        case .oct:
            opeSource = .division
            opeButton(numbering: oct)
        case .dec:
            opeSource = .division
            opeButton(numbering: dec)
        case .hex:
            opeSource = .division
            opeButton(numbering: hex)
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

    //ラベルにタッチした際、枠線の色を変更
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 1:
                highlight(button: hexbutton, label: hexlabel, source: .hex)
                buttonClear()
            case 2:
                highlight(button: decbutton, label: declabel, source: .dec)
                buttonClear()
            case 3:
                highlight(button: octbutton, label: octlabel, source: .oct)
                buttonClear()
            case 4:
                highlight(button: binbutton, label: binlabel, source: .bin)
                buttonClear()
            default:
                break
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hexlabel.isUserInteractionEnabled = true
        declabel.isUserInteractionEnabled = true
        octlabel.isUserInteractionEnabled = true
        binlabel.isUserInteractionEnabled = true
        
        // AdMob広告設定
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPoint(x:0, y:(self.view.frame.size.height - bannerView.frame.height))
        bannerView.frame.size = CGSize(width:self.view.frame.width,height:bannerView.frame.height)
        // AdMobで発行された広告ユニットIDを設定
        bannerView.adUnitID = "ca-app-pub-6765299879929157/5763676500"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        // テスト用の広告を表示する時のみ使用（申請時に削除）
        gadRequest.testDevices = [kGADSimulatorID]
        bannerView.load(gadRequest)
        self.view.addSubview(bannerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

