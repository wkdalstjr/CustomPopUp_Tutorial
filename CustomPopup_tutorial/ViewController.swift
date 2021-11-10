//
//  ViewController.swift
//  CustomPopup_tutorial
//
//  Created by 장민석 on 2021/11/10.
//  Copyright © 2021 장민석. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var createPopUPBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다. ")
            let myChannelUrl = URL(string: "https://www.youtube.com/channel/UC0uxgDnPuNc2AVqZ-jFLPGA")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
}

