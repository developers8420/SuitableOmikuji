//
//  TopViewController.swift
//  SuitableOmikuji
//
//  Created by developers on 2015/09/23.
//  Copyright (c) 2015年 developers. All rights reserved.
//

import UIKit
import iAd

class TopViewController: UIViewController {

    //画面サイズ
    let screenSize: CGSize = UIScreen.mainScreen().bounds.size
    
    //おみくじを引くボタン
    private var pullButton: UIButton!
    
    //バックグランドview
    private var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // iAd(バナー)の自動表示
        self.canDisplayBannerAds = true

        //結果表示用のimageView
        backgroundImageView = UIImageView(frame: CGRectMake(0,0,screenSize.width,screenSize.height))
        backgroundImageView.image = UIImage(named: "トップ背景.png")
        self.view.addSubview(backgroundImageView)
        
        //おみくじを引くボタンの作成
        pullButton = UIButton()
        pullButton.frame = CGRectMake(screenSize.width/4,screenSize.height/2,screenSize.width/4*2,100)
        //pullButton.backgroundColor = UIColor(red: 0.267, green: 0.541, blue: 1.000, alpha: 1.0)
        
        // タイトルを設定する(通常時).
        //pullButton.setTitle("おみくじを引く", forState: UIControlState.Normal)
        //pullButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        let closeImage = UIImage(named: "占うボタン@2x.png")
        pullButton.setImage(closeImage, forState: nil)
        // イベントを追加する.
        pullButton.addTarget(self, action: "modalResult:", forControlEvents: .TouchUpInside)
        self.view.addSubview(pullButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //引くボタンのアクション時に設定したメソッド
    internal func modalResult(sender: UIButton){
        let modalView = ResultViewController()
        modalView.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        self.presentViewController(modalView, animated: true, completion: nil)
        
    }
    
    //以下画面固定
    override func shouldAutorotate() -> Bool{
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
}
