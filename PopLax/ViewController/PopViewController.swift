//
//  PopViewController.swift
//  PopLax
//
//  Created by 高向孚 on 5/13/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

import UIKit
import AudioToolbox
class PopViewController: UIViewController {
    var finTheTouch = true;
//    let url = NSBundle.mainBundle().pathForResource("popsound.m4a", withExtension: nil);

    @IBOutlet var popViews: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startRelaxClicked(sender: UIButton) {
        for popView in popViews{
            popView.image = UIImage(named: "full");
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        finTheTouch = true;
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let aTouch = touches.first;
        if aTouch?.force > 5.0 && finTheTouch == true{
            finTheTouch = false;
            let aTouch = touches.first;
            print(aTouch?.locationInView(self.view));
            for popView in popViews{
                if popView.pointInside(aTouch!.locationInView(popView), withEvent: event) {
                    print(popView.tag);
                    popView.image = UIImage(named: "empty");
                    pop();
                }
            }
            
            print("Hard");
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func pop(){
//        let x = arc4random() % 100;
//        if x>50 {
        var soundID:SystemSoundID = 0;
        let path = NSBundle.mainBundle().pathForResource("popsound", ofType: "wav");
        AudioServicesCreateSystemSoundID(NSURL(fileURLWithPath: path!), &soundID);
            AudioServicesPlaySystemSound(1520);
            AudioServicesPlaySystemSound(soundID);
//        }else if x<25{
//            AudioServicesPlaySystemSound(1521);
//                        AudioServicesPlaySystemSound(0);
//        }else{
//            AudioServicesPlaySystemSound(1519);
//                        AudioServicesPlaySystemSound(0);
//        }
    }
    
}
