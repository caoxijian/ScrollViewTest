//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Jian Jian on 2018/9/8.
//  Copyright © 2018年 CJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = CJScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        scrollView.contentSize = CGSize.init(width: self.view.bounds.width, height: 2 * self.view.bounds.height)
        self.view.addSubview(scrollView)
        var startY:CGFloat = 0.0
        var colors:[UIColor] = [UIColor.red,UIColor.blue,UIColor.yellow,UIColor.gray,UIColor.green]
        for i in 0 ... 100{
            let subView = UILabel()
            subView.text = "第\(i)个视图"
            scrollView.addSubview(subView)
            subView.backgroundColor = colors[i % 5]
            subView.frame = CGRect.init(x: 0, y: startY, width: self.view.bounds.width, height: 20)
            startY = startY + 20
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

