//
//  SecondVC.swift
//  hw4(4-month)
//
//  Created by user on 28/12/23.
//

import UIKit
import SnapKit



class SecondVC: UIViewController, UITableViewDataSource {
    
    private let cell = "NotificationCell"
    private let tableView = UITableView()
    
    private let users: [NotificationModel] = [
        .init(
            userImage: "user1", userTitle: "Jane Cooper has published a new recipe!",
            userData: "Today | 09:24 AM", userFoodImage: "food1"
        ),
        .init(
            userImage: "user2", userTitle: "Rochel has commented on your recipe",
            userData: "1 day ago | 14:43 PM", userFoodImage: "food2"
        ),
        .init(
            userImage: "user3", userTitle: "Brad Wigington liked your comment",
            userData: "1 day ago | 09:29 AM", userFoodImage: "food3"
        ),
        .init(
            userImage: "user4", userTitle: "Tyra Ballentine has published a new recipe!",
            userData: "2 days ago | 10:29 AM", userFoodImage: "food4"
        ),
        .init(
            userImage: "user5", userTitle: "Marci Winkles has published a new recipe!",
            userData: "3 days ago | 16:52 PM", userFoodImage: "food5"
        ),
        .init(
            userImage: "user6", userTitle: "Aileen has commented on your recipe",
            userData: "4 days ago | 14:27 PM", userFoodImage: "food6"
        ),
        .init(
            userImage: "user7", userTitle: "George has commented on your recipe",
            userData: "5 days ago | 09:20 AM", userFoodImage: "food7"
        ),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    private func initUI() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: cell)
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension SecondVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! NotificationTableViewCell
        cell.setupDataCell(
            userIMG: users[indexPath.row].userImage,
            userTitle: users[indexPath.row].userTitle,
            userData: users[indexPath.row].userData,
            userFoodImage: users[indexPath.row].userFoodImage
        )
        return cell
    }
    
}
