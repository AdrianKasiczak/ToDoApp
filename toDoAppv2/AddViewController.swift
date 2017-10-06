//
//  AddViewController.swift
//  toDoAppv2
//
//  Created by Adrian Kasiczak on 02/10/2017.
//  Copyright © 2017 Adrian Kasiczak. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        uiAddTask()
//        view.addSubview(textField)
//        view.addSubview(addTaskButton)
    }
    
    @objc func addTaskAction(sender: AnyObject) {
        if (textField.text != "") {
            sampleTasks.append(textField.text!)
            textField.text = ""
        }
    }
    
    let textField: UITextField = {
        let tf = UITextField()
    tf.placeholder = "Add your task..."
    tf.frame = CGRect(x: 35, y: 150, width: 250, height: 30)
    tf.backgroundColor = .white
    tf.borderStyle = .roundedRect
        return tf
    }()

    
    let addTaskButton: UIButton = {
    let btn = UIButton()
        btn.frame = CGRect(x: 35, y: 200, width: 250, height: 40)
    btn.backgroundColor = UIColor(red: 80/255, green: 220/255, blue: 100/255, alpha: 1)
    btn.setTitle("Add Task", for: .normal)
    btn.addTarget(self, action: #selector(addTaskAction), for: .touchUpInside)
    btn.layer.cornerRadius = 4
        return btn
    }()

    func uiAddTask() {
        view.addSubview(textField)
        view.addSubview(addTaskButton)
    }
    
}
