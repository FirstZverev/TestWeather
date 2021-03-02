//
//  YandexModel.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.

import Foundation

// MARK: - YandexModel
struct YandexModel: Codable {
    let now: Int?
    let nowDt: String?
//    let info: Info?
    let geoObject: GeoObject?
//    let yesterday: Yesterday?
    let fact: Fact?
    let forecasts: [Forecast]?

    enum CodingKeys: String, CodingKey {
        case now
        case nowDt = "now_dt"
//        case info
        case geoObject = "geo_object"
        case fact
        case forecasts
//        case yesterday, fact, forecasts
    }
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime, uptime, temp, feelsLike: Int?
    let icon: String?
    let condition: Condition?
    let cloudness: Double?
    let precType, precProb: Int?
    let precStrength : Double?
    let isThunder: Bool?
    let windSpeed: Double?
    let windDir: WindDir?
    let pressureMm, pressurePa, humidity: Int?
    let daytime: Daytime?
    let polar: Bool?
    let season, source: String?
    let accumPrec: [String: Double]?
    let soilMoisture: Double?
    let soilTemp, uvIndex: Int?
    let windGust: Double?

    enum CodingKeys: String, CodingKey {
        case obsTime = "obs_time"
        case uptime, temp
        case feelsLike = "feels_like"
        case icon, condition, cloudness
        case precType = "prec_type"
        case precProb = "prec_prob"
        case precStrength = "prec_strength"
        case isThunder = "is_thunder"
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
        case pressureMm = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity, daytime, polar, season, source
        case accumPrec = "accum_prec"
        case soilMoisture = "soil_moisture"
        case soilTemp = "soil_temp"
        case uvIndex = "uv_index"
        case windGust = "wind_gust"
    }
}

enum Condition: String, Codable {
    case clear = "clear"
    case partlycloudy = "partly-cloudy"
    case cloudy = "cloudy"
    case overcast = "overcast"
    case drizzle  = "drizzle"
    case lightrain  = "light-rain"
    case rain = "rain"
    case moderate = "moderate"
    case heavy = "heavy"
    case continuous = "continuous"
    case showers = "showers"
    case wetsnow = "wet-snow"
    case lightsnow = "light-snow"
    case snow  = "snow"
    case snowshowers = "snow-showers"
    case hail  = "hail"
    case thunderstorm  = "thunderstorm"
    case thunderstormwithrain = "thunderstorm-with-rain"
    case thunderstormwithhail  = "thunderstorm-with-hail"
}

enum Daytime: String, Codable {
    case d = "d"
    case n = "n"
}

enum Icon: String, Codable {
    case bknN = "bkn_n"
    case iconOvcSn = "ovc_sn"
    case ovc = "ovc"
    case ovcSn = "ovc_+sn"
    case purpleOvcSn = "ovc_-sn"
    case skcD = "skc_d"
    case skcN = "skc_n"
    case bknD = "bkn_d"
}

enum WindDir: String, Codable {
    case nw = "nw"
    case se = "se"
    case s = "s"
    case sw = "sw"
    case w = "w"
    case n = "n"
    case c = "c"
    case e = "e"
    case ne = "ne"
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String?
    let dateTs, week: Int?
    let sunrise, sunset, riseBegin, setEnd: String?
    let moonCode: Int?
    let moonText: String?
    let parts: Parts?
    let hours: [Hour]?
    let biomet: Biomet?

    enum CodingKeys: String, CodingKey {
        case date
        case dateTs = "date_ts"
        case week, sunrise, sunset
        case riseBegin = "rise_begin"
        case setEnd = "set_end"
        case moonCode = "moon_code"
        case moonText = "moon_text"
        case parts, hours, biomet
    }
}

// MARK: - Biomet
struct Biomet: Codable {
    let index: Int?
    let condition: String?
}

// MARK: - Hour
struct Hour: Codable {
    let hour: String?
    let hourTs, temp, feelsLike: Int?
    let icon: String?
    let condition: Condition?
    let cloudness: Double?
    let precType: Int?
    let precStrength: Double?
    let isThunder: Bool?
    let windDir: WindDir?
    let windSpeed, windGust: Double?
    let pressureMm, pressurePa, humidity, uvIndex: Int?
    let soilTemp: Int?
    let soilMoisture, precMm: Double?
    let precPeriod, precProb: Int?
    let source: String?
    let tempMin, tempAvg, tempMax: Int?
    let daytime: Daytime?
    let polar: Bool?

    enum CodingKeys: String, CodingKey {
        case hour
        case hourTs = "hour_ts"
        case temp
        case feelsLike = "feels_like"
        case icon, condition, cloudness
        case precType = "prec_type"
        case precStrength = "prec_strength"
        case isThunder = "is_thunder"
        case windDir = "wind_dir"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case pressureMm = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity
        case uvIndex = "uv_index"
        case soilTemp = "soil_temp"
        case soilMoisture = "soil_moisture"
        case precMm = "prec_mm"
        case precPeriod = "prec_period"
        case precProb = "prec_prob"
        case source = "_source"
        case tempMin = "temp_min"
        case tempAvg = "temp_avg"
        case tempMax = "temp_max"
        case daytime, polar
    }
}

// MARK: - Parts
struct Parts: Codable {
    let day, evening, morning, nightShort: Hour?
    let dayShort, night: Hour?

    enum CodingKeys: String, CodingKey {
        case day, evening, morning
        case nightShort = "night_short"
        case dayShort = "day_short"
        case night
    }
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district, locality, province, country: Country?
}

// MARK: - Country
struct Country: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Info
struct Info: Codable {
    let n: Bool?
    let geoid: Int?
    let url: String?
    let lat, lon: Double?
    let tzinfo: Tzinfo?
    let defPressureMm, defPressurePa: Int?
    let slug: String?
    let zoom: Int?
    let nr, ns, nsr, p: Bool?
    let f, h: Bool?

    enum CodingKeys: String, CodingKey {
        case n, geoid, url, lat, lon, tzinfo
        case defPressureMm = "def_pressure_mm"
        case defPressurePa = "def_pressure_pa"
        case slug, zoom, nr, ns, nsr, p, f
        case h = "_h"
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name, abbr: String?
    let dst: Bool?
    let offset: Int?
}

// MARK: - Yesterday
struct Yesterday: Codable {
    let temp: Int?
}
