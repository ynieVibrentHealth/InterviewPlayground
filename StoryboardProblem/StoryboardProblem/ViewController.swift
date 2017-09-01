//
//  ViewController.swift
//  StoryboardProblem
//
//  Created by Yuchen Nie on 8/31/17.
//  Copyright © 2017 Yuchen Nie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let textInput:[String] = ["Text test Text test Text test Text test ",
                               "Text test Text test ",
                               "Text test Text test Text test ",
                               "Text test Text test Text test Text test Text test ",
                               "Text test "]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textInput.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                 for: indexPath) as! CustomCell
        
        let text = textInput[indexPath.row]
        cell.configure(text: text)
        
        return cell
    }
}

