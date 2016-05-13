//
//  ViewController.swift
//  PopLax
//
//  Created by 高向孚 on 5/12/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var finTheTouch = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var testPopView: UIImageView!
    @IBOutlet weak var testPopButton: UIButton!

    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        self.testPopView.image = UIImage(named: "empty");
    }
    @IBAction func testPopDown(sender: AnyObject) {
        self.testPopButton.setImage(UIImage(named: "empty"), forState: UIControlState.Normal);
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        finTheTouch = false;
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        print(touches);
        finTheTouch = true;
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let aTouch = touches.first;
        if aTouch?.force > 5.0 && finTheTouch == true{
            finTheTouch = false;
            print("Hard");
           AudioServicesPlaySystemSound(1520);
        }
    }

    
    
    
}

