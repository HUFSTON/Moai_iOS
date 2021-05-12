//
//  HomeViewController.swift
//  Moai_iOS
//
//  Created by 이정엽 on 2021/04/29.
//

import UIKit

enum SearchStatus: Int {
    case Scroll = 0
    case Appear = 1
    case Disappear = 2
}

class HomeViewController: UIViewController{
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchBackgroundView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet var searchTableView: UITableView!
    
    var search: SearchStatus = .Appear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewStyle()
        initializeMenu()
        registerCollectionViewCell()
        registerCollectionView()
        self.searchTableView.isHidden = true
        registerTextField()
        registerTableView()
        registerTableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if search == .Appear {
            self.view.endEditing(true)
        } else if search == .Scroll {
            self.searchTableView.isHidden = true
            search = .Appear
        }
        
    }
    // MARK: - Customize View
    private func initializeViewStyle() {
//        self.navigationController?.isNavigationBarHidden = true
        self.searchBackgroundView.layer.cornerRadius = 10
        self.notificationButton.layer.borderWidth = 1
        self.notificationButton.layer.cornerRadius = 10
        self.notificationButton.layer.borderColor = UIColor.LightGray2.cgColor
    }
    
    private func initializeMenu() {
        if #available(iOS 14, *){
            let menu1 = UIAction(title: "menu1", state: .off, handler: {_ in print("1")})
            let menu2 = UIAction(title: "menu2", state: .off, handler: {_ in print("2")})
            filterButton.menu = UIMenu(title: "", image: UIImage(), identifier: .none, options: .displayInline, children: [menu1,menu2])
            filterButton.showsMenuAsPrimaryAction = true
        }
    }
    
    // MARK: - Register Delegate and DataSource
    private func registerCollectionView() {
        self.HomeCollectionView.delegate = self
        self.HomeCollectionView.dataSource = self
    }
    
    private func registerCollectionViewCell() {
        self.HomeCollectionView.register(UINib(nibName: Constants.Cells.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.homeCollectionViewCell)
    }
    
    private func registerTableView() {
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
    }
    
    private func registerTableViewCell() {
        self.searchTableView.register((UINib(nibName: Constants.Cells.searchTableViewCell, bundle: nil)), forCellReuseIdentifier: Constants.Cells.searchTableViewCell)
    }
    
    private func registerTextField() {
        self.searchTextField.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func touchSearchButton(_ sender: Any) {
    }
    
    @IBAction func touchNotificationButton(_ sender: Any) {
    }
}

// MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? HomeCollectionViewCell else {
            return
        }
        cell.itemImageView.kf.cancelDownloadTask()
    }
    
}

// MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.homeCollectionViewCell, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.initializeView("https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078__340.jpg")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Constants.Storyboards.itemDetail, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.ViewControllers.itemDetailViewController) as? ItemDetailViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.search = .Scroll
        self.searchTextField.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTextField.text = "asdf"
        if search == .Appear {
            self.view.endEditing(true)
        } else if search == .Scroll {
            self.searchTableView.isHidden = true
            search = .Appear
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.searchTableViewCell) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.initializeCell("asdf")
        return cell
    }
    

    
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if search == .Appear {
            self.searchTableView.isHidden = true
        }
        search = .Disappear
    
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.searchTableView.isHidden = false
        search = .Appear
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTableView.isHidden = true
        self.view.endEditing(true)
        return true
    }

}
