//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Nuthan Raju Pesala on 22/06/21.
//

import UIKit

class ViewController: UIViewController {

    private let table: UITableView = {
       let tv = UITableView()
        tv.register(WeatherTableViewCell.createNib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(red: 50/255, green: 158/255, blue: 190/255, alpha: 1)
        title = "Weather Forecast"
        self.view.addSubview(table)
        table.dataSource = self
        table.delegate = self
       
        view.backgroundColor = UIColor(red: 50/255, green: 158/255, blue: 190/255, alpha: 1)
        table.backgroundColor = UIColor(red: 50/255, green: 158/255, blue: 190/255, alpha: 1)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.table.frame = view.bounds
    }
   

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.backgroundColor = UIColor(red: 50/255, green: 158/255, blue: 190/255, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
            let countryNameLabel = UILabel(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: 30))
            let summaryLabel =  UILabel(frame: CGRect(x: 0, y: 65, width: view.frame.width, height: 20))
            let tempLabel =  UILabel(frame: CGRect(x: 0, y: 90, width: view.frame.width, height: 50))
            header.addSubview(countryNameLabel)
            header.addSubview(summaryLabel)
            header.addSubview(tempLabel)
            countryNameLabel.textAlignment = .center
            summaryLabel.textAlignment = .center
            tempLabel.textAlignment = .center
            countryNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            summaryLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            tempLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
            countryNameLabel.text = "Kakinada,Andhra Pradesh"
            summaryLabel.text = "Mostly,Cloudy"
            tempLabel.text = "18°C"
            
            return header
        case 1:
            let layout = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            layout.scrollDirection = .horizontal
            collectionView.frame = CGRect(x: 15, y: 0, width: view.frame.width, height: 150)
            collectionView.backgroundColor = UIColor(red: 50/255, green: 158/255, blue: 190/255, alpha: 1)
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            collectionView.dataSource = self
            collectionView.delegate = self
            return collectionView
        default:
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        }
        return 180
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as! WeatherCollectionViewCell
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 4 ) - 2, height: (collectionView.frame.width / 4) - 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
