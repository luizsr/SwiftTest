//
//  CategoriesTableViewController.swift
//  SwiftTest
//
//  Created by Yuriy Berdnikov on 9/22/14.
//  Copyright (c) 2014 Yuriy Berdnikov http://perpet.io. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    private let contentDataSource = ["Simple wash", "Launder & Press", "Dry Cleaning", "Simple wash Simple wash", "Launder & Press", "Dry Cleaning"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView();
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "categoryCellReuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return contentDataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = contentDataSource[indexPath.row]
        cell.accessoryView = UIImageView(image: UIImage(named: "accessory.png"))
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let subcategoriesTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("subcategoriesTableViewController") as SubcategoriesTableViewController
        subcategoriesTableViewController.category = self.contentDataSource[indexPath.row]
        self.navigationController?.pushViewController(subcategoriesTableViewController, animated: true)
    }
}
