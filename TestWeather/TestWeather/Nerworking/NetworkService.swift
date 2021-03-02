//
//  NetworkService.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.
//

import Foundation
import Alamofire

class NetworkService {
    let urlMain = "https://api.weather.yandex.ru/v2/forecast?"

    func cityForLotAndLat(lat: Double, lot: Double, completion: @escaping (_ model: YandexModel?,_ error: String?) -> ()) {
        let headers: HTTPHeaders = [
            "X-Yandex-API-Key": "7c8d7a11-fa12-4460-86a2-e5f184d60c1b",
        ]
        let urlString = urlMain + "lat=\(lat)5&lon=\(lot)"
        let request = AF.request(urlString, headers: headers)
            .validate()
        request.responseDecodable(of: YandexModel.self) { (response) in
            print(response)
            guard let network = response.value else { return }
            completion(network, nil)
        }
    }
}
