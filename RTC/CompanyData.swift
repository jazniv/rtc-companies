//
//  CompanyData.swift
//  RTC
//
//  Created by Juliana Glodek on 8/2/21.
//

import Foundation
import Combine

var companies: [Company] = load("companyData.json")


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct Company: Codable, Identifiable, Hashable {
    var id: String
    var headline: String
    var description: String
    var roleTypes: [String]
    var roles: [String]
    var internOpen: String
    var internClose: String
    var newGradOpen: String
    var newGradClose: String
    var jobsUrl: String = "www.google.com"
    var contact: String
}
