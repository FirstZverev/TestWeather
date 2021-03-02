//
//  ModelView.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.
//

import Foundation

class ViewModelWeather {
    var coordinators: [Coordinator] = [
        Coordinator(id: 0, name: "Казань", lat: 55.7887, lot: 49.1221),
        Coordinator(id: 1, name: "Москва", lat: 55.75222, lot: 37.61556),
        Coordinator(id: 2, name: "Краснодар", lat: 45.04484, lot: 38.97603),
        Coordinator(id: 3, name: "Киров", lat: 58.603591, lot: 49.668014),
        Coordinator(id: 4, name: "Альмевск", lat: 54.901383, lot: 52.297113),
        Coordinator(id: 5, name: "Сочи", lat: 43.585472, lot: 39.723089),
        Coordinator(id: 6, name: "Владикавказ", lat: 43.024616, lot: 44.681762),
        Coordinator(id: 7, name: "Гелинджик", lat: 37.737716, lot: 30.445711),
        Coordinator(id: 8, name: "Санкт-Петербург", lat: 59.938951, lot: 30.315635),
        Coordinator(id: 9, name: "Владимир", lat: 56.129057, lot: 40.406635),
    ]
        
    var modelWeather: [ModelWeather] = []
    var modelWeatherSearching: [ModelWeather] = []
//    var cityName = ["Казань","Москва","Санкт-Петербург","Ульяновск","Краснодар","Киров","Владивосток","Орёл","Зеленодольск","Альметевск"]
    var yandexModel: YandexModel?
}

struct Coordinator {
    let id: Int
    let name: String
    let lat: Double
    let lot: Double
}

struct ModelWeather {
    let id: Int
    let name: String
    let temp: Int
    let state: String
    let model: YandexModel?
}
