//
//  MemoViewController.swift
//  Memopad
//
//  Created by 井戸海里 on 2020/09/07.
//  Copyright © 2020 IdoUmi. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    //ラベルの宣言
    @IBOutlet var titleTextFiled: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    //ユーザーデフォルトにアクセス
    var saveData : UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextFiled.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextFiled.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //ボタンの宣言
    @IBAction func saveMemo(){
        //ユーザーデフォルトに書き込み
        saveData.set(titleTextFiled.text,forKey: "title")
        saveData.set(contentTextView.text,forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        
                        self.navigationController?.popViewController(animated: true)
                        print("OKボタンが押されました!")
                }
            )
        )
        present(alert,animated: true,completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
