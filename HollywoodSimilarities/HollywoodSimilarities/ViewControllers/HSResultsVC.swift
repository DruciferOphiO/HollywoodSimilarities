//
//  HSResultsVC.swift
//  HollywoodSimilarities
//
//  Created by Andrew McKinley on 2/15/16.
//  Copyright © 2016 Andrew McKinley. All rights reserved.
//

import UIKit

class HSResultsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var similarCast:[Actor]!
    let tableView:UITableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
    convenience init(_similarCast:[Actor]!){
        self.init()
        self.similarCast = _similarCast
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: Config.CellIdentifiers.cellID)

        self.view.addSubview(self.tableView)
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return similarCast.count
    }


    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Config.CellIdentifiers.cellID, forIndexPath: indexPath)
        
        cell.textLabel?.text = self.similarCast[indexPath.row].name
        
        return cell
    }
}
