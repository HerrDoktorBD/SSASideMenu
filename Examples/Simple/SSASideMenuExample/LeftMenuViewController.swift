//
//  LeftMenuViewController.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2015 Sebastian Andersen. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    let heightForRow: CGFloat = 54

    lazy var tableView: UITableView = {

        let tableView = UITableView()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 20,
                                 y: (self.view.frame.size.height - heightForRow * CGFloat(titles.count)) / 2.0,
                                 width: self.view.frame.size.width,
                                 height: heightForRow * CGFloat(titles.count))
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false

        return tableView
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)
    }

    lazy var titles: [String] = {

        return [
            "Home",
            "Calendar",
            "Profile",
            "Settings",
            "Log Out"
        ]
    }()

    lazy var images: [String] = {

        return [
            "IconHome",
            "IconCalendar",
            "IconProfile",
            "IconSettings",
            "IconEmpty"
        ]
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
   
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 21)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = titles[indexPath.row]
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: images[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        var vc = UIViewController()

        switch indexPath.row {

            case 0:
                vc = HomeViewController()

            case 1:
                vc = CalendarViewController()

            default:
                sideMenuViewController?.hide()
                return
        }

        let nc = UINavigationController(rootViewController: vc)
        sideMenuViewController?.contentViewController = nc

        sideMenuViewController?.hide()
    }
}
    
