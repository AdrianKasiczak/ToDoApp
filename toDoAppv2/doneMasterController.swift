//
//  ViewController.swift
//  toDoAppv2
//
//  Created by Adrian Kasiczak on 02/10/2017.
//  Copyright © 2017 Adrian Kasiczak. All rights reserved.
//

import UIKit

var sampleTasks = ["Zrobić zakupy", "Napisać aplikację ToDo", "Nagrać film Geniusze IT"]

class doneMasterController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Important
    let cellId = "cellId"
    
    var tableView = UITableView()
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = sampleTasks.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: val, green: 0.6, blue: 0.3, alpha: 1.0)
    }
    
    
    func styleTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(itemCellController.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .black
        
        //Style Cells
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        styleTableView()
        navigationItem.title = "Tasks To Do"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addClicked(_:)))
    }
    
    @objc func addClicked(_ sender: UIBarButtonItem) {
        let vc = AddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = sampleTasks[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            sampleTasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

