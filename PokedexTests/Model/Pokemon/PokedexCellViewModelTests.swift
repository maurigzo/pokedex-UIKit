//
//  PokedexCellViewModelTests.swift
//  PokedexTests
//
//  Created by Mauri on 18/05/2022.
//

import Foundation
import XCTest
@testable import Pokedex

class PokedexCellViewModelTests: XCTestCase {
    
    func testPokedexCellNumberText() {
        // Given
        let pokedexCellModel = PokedexCellViewModel(name: "Bauri", number: 5P, image: nil)
        let expectedResult = "#5"

        // When
        let actualResult = pokedexCellModel.numberText

        // Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
}
