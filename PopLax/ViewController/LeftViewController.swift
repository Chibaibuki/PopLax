//
//  LeftViewController.swift
//  PopLax
//
//  Created by 高向孚 on 5/20/16.
//  Copyright © 2016 ByStudio. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var leftTableView: UITableView!
    let reuseIdentifier = "LeftTableViewCellReuseIdentifier";
    let leftTableTitle = ["收集灵感","设置"];
    let imageNames = ["CommentHd","SettingHd"];
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTableView.backgroundColor = UIColor(white: 1, alpha: 0);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftTableTitle.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var aCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier);
        
        if aCell == nil {
            aCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier);
        }
        
        aCell?.textLabel?.text = leftTableTitle[indexPath.row];
        aCell?.textLabel?.textColor = UIColor(white: 1, alpha: 1);
        aCell?.imageView?.image = UIImage(named: imageNames[indexPath.row]);
        aCell?.backgroundColor  = UIColor(white: 1, alpha: 0);
        return aCell!;
    }
    //MARK
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let aCmVc = CommentViewController(nibName: "CommentViewController", bundle: nil)
//        self.navigationController?.pushViewController(aCmVc, animated:true);
        self.presentViewController(aCmVc, animated: true, completion: nil);
        
    }/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
