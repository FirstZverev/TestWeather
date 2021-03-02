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
    let networkService = NetworkService()
    
    let vc = InfoCityController()
    var viewModel: ViewModelWeather = ViewModelWeather()
    var searching: Bool = false
    
    var refreshControl: UIRefreshControl? = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemGray
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    @objc func refresh() {
        viewModel.modelWeather.removeAll()
        tableView.reloadData()
        networking()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationCusmotizing(nav: navigationController!, navItem: navigationItem, title: "Погода")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        tableView.addSubview(refreshControl!)
        registerCell()
        searchFieldCteate()
        networking()
    }
    
    func networking() {
        for item in viewModel.coordinators {
            networkService.cityForLotAndLat(lat: item.lat, lot: item.lot) { (model, error) in
                guard let yandexModel = model,
                      let nameCity = yandexModel.geoObject?.locality?.name,
                      let retionCity = yandexModel.geoObject?.province?.name,
                      let stateCity = yandexModel.fact?.condition,
                      let tempCity = yandexModel.fact?.temp else {return}
                let model: ModelWeather = ModelWeather(id: 1, name: retionCity +  ", " + nameCity, temp: tempCity, state: stateCity.rawValue, model: yandexModel)
                self.viewModel.modelWeather.append(model)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchFieldCteate() {
        searchController.searchBar.delegate = self
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        extendedLayoutIncludesOpaqueBars = true
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
        return searching ? viewModel.modelWeatherSearching.count : viewModel.modelWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        if !searching {
            cell.city.text = viewModel.modelWeather[indexPath.row].name
            cell.temprature.text = "\(viewModel.modelWeather[indexPath.row].temp)°"
            cell.state.text = viewModel.modelWeather[indexPath.row].state
        } else {
            cell.city.text = viewModel.modelWeatherSearching[indexPath.row].name
            cell.temprature.text = "\(viewModel.modelWeatherSearching[indexPath.row].temp)"
            cell.state.text = viewModel.modelWeatherSearching[indexPath.row].state
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !searching {
            vc.yandexModel = viewModel.modelWeather[indexPath.row].model
        } else {
            vc.yandexModel = viewModel.modelWeatherSearching[indexPath.row].model
        }
        navigationController?.present(vc, animated: true)
    }
}

extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        if searchText != "" {

            viewModel.modelWeatherSearching = viewModel.modelWeather.filter({$0.name.lowercased().contains(searchText!.lowercased())})
            searching = true
            tableView.reloadData()
        } else {
            searching = false
        }
        tableView.reloadData()
    }
    
    
    
}
