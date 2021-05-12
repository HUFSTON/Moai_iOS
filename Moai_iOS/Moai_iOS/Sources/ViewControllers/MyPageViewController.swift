//
//  MyPageViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/05/01.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet var myPageTableView: UITableView!
    @IBOutlet var sellerImageView: UIImageView!
    @IBOutlet var sellerNameLabel: UILabel!
    @IBOutlet var notificationButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        registerTableViewCell()
        initializeImageView()
        initializeButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func registerTableView() {
        self.myPageTableView.delegate = self
        self.myPageTableView.dataSource = self
        self.myPageTableView.separatorStyle = .none
    }
    
    private func registerTableViewCell() {
        self.myPageTableView.register(UINib(nibName: Constants.Cells.myPageTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.myPageTableViewCell)
    }
    
    private func initializeImageView() {
        self.sellerImageView.layer.cornerRadius = self.sellerImageView.frame.height / 2
    }
    
    private func initializeButtons() {
        self.searchButton.layer.borderWidth = 1
        self.searchButton.layer.borderColor = UIColor.LightGray2.cgColor
        self.searchButton.layer.cornerRadius = 10
        
        self.notificationButton.layer.borderWidth = 1
        self.notificationButton.layer.borderColor = UIColor.LightGray2.cgColor
        self.notificationButton.layer.cornerRadius = 10
    }

}

extension MyPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.myPageTableViewCell, for: indexPath) as? MyPageTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
