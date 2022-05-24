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
    
    private let bulbasaurModel = PokedexCellViewModel(
        name: "bulbasaur",
        number: 1,
        image: nil,
        types: [
                PokemonType(type: PokemonTypeName(name: "plant")),
                PokemonType(type: PokemonTypeName(name: "poison"))
        ])
    
    private let charmanderModel = PokedexCellViewModel(
        name: "charmander",
        number: 4,
        image: nil,
        types: [
                PokemonType(type: PokemonTypeName(name: "fire"))
        ])
    
    
    func testPokedexCellNumberText() {
        // Given
        let expectedResult = "#1"

        // When
        let actualResult = bulbasaurModel.numberText

        // Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testPokedexCellCapitalizedName() {
        //Given
        let expectedResult = "Bulbasaur"
        
        //When
        let actualResult = bulbasaurModel.capitalizedName
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testPokedexCellFirstType() {
        //Given
        let expectedResult = "Plant"
        
        //When
        let actualResult = bulbasaurModel.firstType
        
        //Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testPokedexCellSecondType() {
        // Given
        let expectedResult = "Poison"

        // When
        let actualResult = bulbasaurModel.secondType

        // Then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testPokedexCellSecondTypeNil() {
        //When
        let actualResult = charmanderModel.secondType
        
        //Then
        XCTAssertNil(actualResult)
    }
    
}

