//
//  CustomPopUpViewController.swift
//  CustomPopup_tutorial
//
//  Created by 장민석 on 2021/11/10.
//  Copyright © 2021 장민석. All rights reserved.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var openChatBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate: PopUpDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        
    }
    
    //MARK: - IBAction
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        
        print("CustomPopUpViewController - onBgBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            // 메인에 알린다.
            subscribeBtnCompletionClosure()
        }
        
    }
    
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        
        myPopUpDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
}
