//
//  ViewController.swift
//  TodoApp
//
//  Created by 三浦拓真 on 2021/06/10.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var memoText: UITextView!
    
    var takeTitle: String? = nil
    
    var takeText: String? = nil
    
    var takeNum: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.delegate = self
        
        if takeTitle != nil && takeText != nil {
        
            titleText.text = takeTitle
            memoText.text = takeText
        }
    }
    //戻るボタンを押した時の処理（戻る前にSaveする）
       // UINavigationControllerDelegateのメソッド。遷移する直前の処理。
       func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
          
           // 表示先のクラス：viewController引数を、型キャストすることで、遷移先がTableViewControllerである時のみ処理実行
           if let controller = viewController as? TableViewController {
          
               if titleText.text == "" {
                   
                   titleText.text = "No Data"
                   
               }
               
               if memoText.text == "" {
                   
                   memoText.text = "No Data"
               }
               
               
            if takeNum == nil {
            //新規メモを保存するときの処理
            controller.titleArray.append(titleText.text!)
            controller.memoArray.append(memoText.text!)
            
            //既存メモを開いてそれを保存する時の処理
            } else {
                controller.titleArray[takeNum!] = titleText.text!
                controller.memoArray[takeNum!] = memoText.text!
                
            }
               controller.tableView.reloadData()

               
               
           }
       }

}

