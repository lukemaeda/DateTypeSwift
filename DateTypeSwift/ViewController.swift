//
//  ViewController.swift
//  DateTypeSwift
//
//  Created by MAEDAHAJIME on 2015/07/10.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // [簡易表示]ボタンを押す
    @IBAction func proc01(sender: UIButton) {
        
        // 表示対象（現在日時（システム日付））
        let dt:NSDate = NSDate()
        
        // パターン１ description:説明
        let str01:NSString = dt.description
        println(" \(str01))") // 2015-07-10 04:35:24
        
        // パターン２
        let str02:NSString = dt.descriptionWithLocale(NSLocale .currentLocale())!
        println(" \(str02))") // Friday, July 10, 2015 at 1:35:24 PM Japan Standard Time

    }
    
    // [表示（書式スタイル設定）]ボタンを押す
    @IBAction func proc02(sender: UIButton) {
        
        // 表示対象
        let dt:NSDate = NSDate()
        
        //日時書式作成
        let df:NSDateFormatter = NSDateFormatter()
        
        // スタイル１
        
        df.dateStyle = .ShortStyle
        df.timeStyle = .ShortStyle
        
        println("1. \(df.stringFromDate(dt))") // 1. 7/10/15, 1:31 PM
        
        
        // スタイル２
        df.dateStyle = .MediumStyle
        df.timeStyle = .MediumStyle
        
        println("2. \(df.stringFromDate(dt))") // 2. Jul 10, 2015, 1:31:20 PM
        
        // スタイル３
        df.dateStyle = .LongStyle
        df.timeStyle = .LongStyle
        
        println("3. \(df.stringFromDate(dt))") // 3. July 10, 2015 at 1:32:44 PM GMT+9
        
        // スタイル４
        df.dateStyle = .FullStyle
        df.timeStyle = .FullStyle
        
        println("4. \(df.stringFromDate(dt))") // 4. Friday, July 10, 2015 at 1:32:44 PM Japan Standard Time
        
        // スタイル５
        df.dateStyle = .NoStyle  // 時刻だけ表示させない
        df.timeStyle = .FullStyle
        
        println("5. \(df.stringFromDate(dt))") // 5. 1:34:31 PM Japan Standard Time
    }
    
    // [表示（書式設定）]ボタンを押す
    @IBAction func proc03(sender: UIButton) {
        
        // 表示対象
        let dt:NSDate = NSDate()
        
        //日時書式作成
        let df:NSDateFormatter = NSDateFormatter()
        
        // パターン１
        df.dateFormat = "yyyy/MM/dd"
        println("1. \(df.stringFromDate(dt))") // 1. 2015/07/10
        
        // パターン２
        df.dateFormat = "HH/mm/ss"
        println("2. \(df.stringFromDate(dt))") // 2. 13/40/18
        
        // パターン３ AD Anno Domini
        df.dateFormat =
        "GGGGyyyy年MM月dd日(EEEE)"
        "HH時mm分ss秒"
        println("3. \(df.stringFromDate(dt))") // 3. Anno Domini2015年07月10日(Friday)
    }
    
    // [表示（言語環境（書式（ロケール）、カレンダー）設定）]ボタンを押す
    @IBAction func proc04(sender: UIButton) {
        
        // 表示対象
        let dt:NSDate = NSDate()
        
        //日時書式作成
        let df:NSDateFormatter = NSDateFormatter()
        
        // パターン１（システム設定）
        df.locale = NSLocale.currentLocale()
        df.calendar = NSCalendar.currentCalendar()

        //df.dateStyle = df.timeStyle = NSDateFormatterStylef() // 識別子:4 でも処理出来る
        // 日付型　文字列変換
        println("1. \(df.stringFromDate(dt))") // 1. Friday, July 10, 2015 at 2:35:34 PM Japan Standard Time
        
        // パターン２（設定：英語　ー　アメリカ合衆国、西暦）
        df.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
        df.calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    
        df.dateFormat = "yyyy/MM/dd(EEEE) HH:mm:ss"
        println("2. \(df.stringFromDate(dt))") // 2. 2015/07/10(Friday) 14:04:55
        
        // パターン３（設定：日本語　ー　日本、和暦）
        df.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        df.calendar = NSCalendar(identifier: NSCalendarIdentifierJapanese)!

        // (EE)金 (EEEE)金曜日
        df.dateFormat = "GGyy年MM月/dd日(EEEE) ahh:mm:ss";
        println("3. \(df.stringFromDate(dt))") // 3. 平成27年07月/10日(金曜日) 午後02:04:55
        
    }
    
    // [表示（ロケール識別子一覧）]ボタンを押す
    @IBAction func proc05(sender: UIButton) {
        
        // 利用可能な「言語/国コード」
        let arr:NSArray = NSLocale.availableLocaleIdentifiers()
        println("1. \(arr)")
        
    }
    
    // [表示（タイムゾーン設定）]ボタンを押す
    @IBAction func proc06(sender: UIButton) {
        
        // 調査中
    }
    
    // [タイムゾーン一覧]ボタンを押す
    @IBAction func proc07(sender: UIButton) {
        
        let dic:NSDictionary = NSTimeZone.abbreviationDictionary()
        println(" \(dic)")
    }
    
    // [文字列から変換]ボタンを押す
    @IBAction func proc08(sender: UIButton) {
        
        // 日時書式の作成
        let df:NSDateFormatter = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        // 日付型へ変換
        let str:NSString = "1957/02/15 23:59:59"
        let dt:NSDate = df.dateFromString(str as String)!
        
        println("\(dt.descriptionWithLocale(NSLocale.currentLocale()))")
        
    }
    
    // [経過日時の取得]ボタンを押す
    @IBAction func proc09(sender: UIButton) {
        
        // 調査中
    }
    
   // [一致判定]ボタンを押す
    @IBAction func proc10(sender: UIButton) {
        
        // 日時書式の作成
        let df:NSDateFormatter = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let dt01:NSDate = df.dateFromString("2000/01/01 01:01:01")!
        let dt02:NSDate = df.dateFromString("2000/01/01 01:01:01")!
        
        //
        var res:Bool = dt01 == dt02
        
        if (res) { // (res == YES)
            println("一致")
        } else {
            println("不一致")
        }

    }
    
    // [大小判定]ボタンを押す
    @IBAction func proc11(sender: UIButton) {
        
         // 調査中
    }

}

