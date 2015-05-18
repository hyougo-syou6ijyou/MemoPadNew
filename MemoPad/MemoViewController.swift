//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 木嶋将登 on 2015/05/17.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!

    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.objectForKey("title") as! String?
        contentTextView.text = saveData.objectForKey("content") as! String?
        
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMemo() {
        saveData.setObject(titleTextField.text, forKey:"title")
        saveData.setObject(contentTextView.text, forKey: "content")
        saveData.synchronize()
        
        let alert = UIAlertController(title: "保存", message: "メモの保存が完了しました！！", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Default,
                handler: {action in
                    
                    NSLog("OKボタンが押されました！！")
                    self.navigationController?.popViewControllerAnimated(true)
                }
            )
        )
        
        presentViewController(alert, animated: true, completion: nil)
        
        }
    
    func titleTextFieldShouldReturn(textField: UITextField) -> Bool{
            textField.resignFirstResponder()
            return true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
