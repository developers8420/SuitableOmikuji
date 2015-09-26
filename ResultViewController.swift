//
//  ResultViewController.swift
//  SuitableOmikuji
//
//  Created by developers on 2015/09/23.
//  Copyright (c) 2015年 developers. All rights reserved.
//

import UIKit
import iAd

class ResultViewController: UIViewController {

    //結果表示用のimageView
    private var resultImageView: UIImageView!
    
    //画面サイズ
    let screenSize: CGSize = UIScreen.mainScreen().bounds.size
    
    // ステータスバーの高さを取得
    let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
    
    //閉じるボタン
    private var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // iAd(バナー)の自動表示
        self.canDisplayBannerAds = true
        
        // 乱数生成.
        let randomInt : Int = Int(getRandomNumber(Min: 1, Max: 5))
        
        //結果表示用のimageView
        resultImageView = UIImageView(frame: CGRectMake(0,0,screenSize.width,screenSize.height))

        //乱数ごとにおみくじ結果を表示
        switch randomInt {
            //凶
            case 1 :
                // 画像をUIImageViewに設定する.
                resultImageView.image = UIImage(named: "凶.png")
                break
            
            //小吉
            case 2 :
                // 画像をUIImageViewに設定する.
                resultImageView.image = UIImage(named: "小吉.png")
                break
            
            //中吉
            case 3 :
                // 画像をUIImageViewに設定する.
                resultImageView.image = UIImage(named: "中吉.png")
                break
            
            //大吉
            case 4 :
                // 画像をUIImageViewに設定する.
                resultImageView.image = UIImage(named: "大吉.png")
                break
            
            //はずれ(凶と同じ)
            default :
                // 画像をUIImageViewに設定する.
                resultImageView.image = UIImage(named: "凶.png")
                break
            }
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(resultImageView)
        
        //閉じるボタンの作成
        let closeImage = UIImage(named: "バツボタン@2x.png")
        closeButton = UIButton()
        closeButton.frame = CGRectMake(15,statusBarHeight+5,30,30)
        //closeButton.backgroundColor = UIColor(red: 0.267, green: 0.541, blue: 1.000, alpha: 1.0)
        closeButton.setImage(closeImage, forState: nil)
        
        // イベントを追加する.
        closeButton.addTarget(self, action: "closeModal:", forControlEvents: .TouchUpInside)
        self.view.addSubview(closeButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //乱数を生成
    func getRandomNumber(Min _Min : Float, Max _Max : Float)->Float {
        
        return ( Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX) ) * (_Max - _Min) + _Min
    }

    //閉じるボタンのアクション時に設定したメソッド
    internal func closeModal(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //以下画面固定
    override func shouldAutorotate() -> Bool{
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
}
