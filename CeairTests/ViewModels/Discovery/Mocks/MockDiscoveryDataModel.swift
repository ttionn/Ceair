//
//  MockDiscoveryDataModel.swift
//  CeairTests
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDiscoveryDataModel: DiscoveryDataModelProtocol {
    
    var isFetchThemesCalled = false
    var isFetchCitiesCalled = false
    var isLoadImageCalled = false
    
    var fakeThemes: [DiscoveryTheme]?
    var fakeCities: [[DiscoveryCity]]?
    
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void) {
        isFetchThemesCalled = true
        completion(fakeThemes ?? [])
    }
    
    func fetchCities(completion: @escaping ([[DiscoveryCity]]) -> Void) {
        isFetchCitiesCalled = true
        completion(fakeCities ?? [])
    }
    
    func loadImage(from url: String, completion: @escaping (String, Data) -> Void) {
        isLoadImageCalled = true
    }
    
}
