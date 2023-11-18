//
//  ModelsTests.swift
//  ModelsTest
//
//  Created by ibautista on 16/11/23.
//

import XCTest
@testable import AppSwifUIInmaBautista


final class ModelsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModels() throws {
        let modelCharacters = CharacterFake().responseCharacters.data.results
        XCTAssertNotNil(modelCharacters)
        XCTAssertNotEqual(modelCharacters.first?.name, "Pepe")
        XCTAssertEqual(modelCharacters.count, 4)
        
        let modelSeries = SeriesFake().responseSeries.data.results
        XCTAssertNotNil(modelSeries)
        XCTAssertNotEqual(modelSeries.first?.title, "La maté por un yogurt (a.C.)")
        XCTAssertEqual(modelSeries.count, 2)
        
    }

}
