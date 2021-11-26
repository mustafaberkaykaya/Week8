//
//  ViewController.swift
//  Week8
//
//  Created by Mustafa Berkay Kaya on 24.11.2021.
//

import UIKit
import Alamofire
import Kingfisher
import IQKeyboardManagerSwift

private var results: [Result] = []

class ViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
   private func getPhoto(query: String) {
        AF.request("https://api.unsplash.com/search/photos?page=1&per_page=30&query=\(query)&client_id=HJdsjZ1Nd3la5DuRzIVxG9_n5OfIkcw5e6QZMYiwN_0",
                   method: .get).responseJSON {response in
            
            if let data = response.data {
                do {
                    let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        results = jsonResult.results
                        self.tableView.reloadData()
                    }
                  
                } catch {
                    print(error)
                }
            }
        }
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            getPhoto(query: text)
            tableView.reloadData()
            searchBar.endEditing(true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return results.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageUrlString = results[indexPath.row].urls.small
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell {
            print("***************")
            print(imageUrlString)
            print("***************")
            cell.setImage().kf.setImage(with: URL(string: imageUrlString))
            return cell
        }
       
        return UITableViewCell()
    }
}
