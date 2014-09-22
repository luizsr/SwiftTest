//
//  SubcategoriesTableViewController.swift
//  SwiftTest
//
//  Created by Yuriy Berdnikov on 9/22/14.
//  Copyright (c) 2014 Yuriy Berdnikov http://perpet.io. All rights reserved.
//

import UIKit

class SubcategoriesTableViewController: UITableViewController {
    
    var category : NSString?
    private let contentDataSource = [
        ["title" : "Shirts and casual", "price" : "$3.00"],
        ["title" : "Evening Ware", "price" : "$9.00"],
        ["title" : "Pants & more", "price" : "$13.00"],
        ["title" : "Wedding Dresses", "price" : "$105.00"],
        ["title" : "Basics", "price" : "$76.00"],
        ["title" : "Pants shirts & more", "price" : "$98.00"],
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.category
        
        let backImage = UIImage(named: "back.png").imageWithRenderingMode(.AlwaysOriginal);
        
        let backBarButton = UIBarButtonItem(image: backImage, style: .Bordered, target: self, action: "backButtonPressed:")
        self.navigationItem.leftBarButtonItem = backBarButton;
        
        tableView.tableFooterView = UIView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentDataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCategoryCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        let subcategoryData = contentDataSource[indexPath.row]
        
        cell.textLabel?.text = subcategoryData["title"]
        cell.detailTextLabel?.text = subcategoryData["price"]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - UIBarButtonItem selector
    func backButtonPressed(sender: UIButton!) {
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
}
