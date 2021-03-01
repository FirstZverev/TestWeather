//
//  ViewController.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)

    var viewModel: ViewModelWeather = ViewModelWeather()
    var searching: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        navigationCusmotizing(nav: navigationController!, navItem: navigationItem, title: "Погода")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        searchFieldCteate()
    }
    func searchFieldCteate() {
        searchController.searchBar.delegate = self
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        extendedLayoutIncludesOpaqueBars = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController

        definesPresentationContext = true

    }
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? viewModel.cityNameSearch.count : viewModel.cityName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        print(viewModel.cityName[indexPath.row])
        if !searching {
            cell.city.text = viewModel.cityName[indexPath.row]
            cell.temprature.text = "+20"
            cell.state.text = "Ветер"
        } else {
            cell.city.text = viewModel.cityNameSearch[indexPath.row]
            cell.temprature.text = "+30"
            cell.state.text = "Дождь"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        if searchText != "" {

            viewModel.cityNameSearch = viewModel.cityName.filter({$0.lowercased().contains(searchText!.lowercased())})
            print(viewModel.cityNameSearch)
            searching = true
            tableView.reloadData()
        } else {
            searching = false
        }
        tableView.reloadData()
    }
    
    
    
}
