//
//  ViewController.swift
//  iphonex
//
//  Created by marspro on 2017/11/25.
//  Copyright © 2017年 swiftcafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var tableItems: [(String, (UINavigationController, String) -> Void)] = [
        ("适配1", { nav, title in
            
            var demo1 = Demo1ViewController()
            demo1.title = title
            nav.pushViewController(demo1, animated: true)
            
        }),
        ("适配2", { nav, title in
            
        }),
        ("适配3", { nav, title in
            
        })
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "iPhone X 适配演示"
        
        let tableView = UITableView(frame: CGRect.zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        self.tableView = tableView
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        self.tableView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

    // MARK: UITableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = tableItems[indexPath.row].0
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nav = self.navigationController {
            
            tableItems[indexPath.row].1(nav, tableItems[indexPath.row].0)
            
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

}

