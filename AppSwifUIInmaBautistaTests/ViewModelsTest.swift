//
//  ViewModelsTest.swift
//  AppSwifUIInmaBautistaTests
//
//  Created by ibautista on 18/11/23.
//

import XCTest
@testable import AppSwifUIInmaBautista
import Combine

final class ViewModelsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRootViewModel() throws {
        let expectation = self.expectation(description: "Descarga de personajes")
        var suscriptor = Set<AnyCancellable>()
        
        let vm = RootViewModel(characterCaseUse: CharactersUseCaseFakeSuccess())
        XCTAssertNotNil(vm)
        
        vm.characters.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
                XCTAssertEqual(data.count, 4)
            }
            .store(in: &suscriptor)
        
        self.waitForExpectations(timeout: 10)
    }
    
    func testSeriesViewModel() throws {
        let expectation = self.expectation(description: "Descarga de series")
        var suscriptor = Set<AnyCancellable>()
        
        let vm = SeriesViewModel(characterId: 12, seriesCaseUse: SeriesUseCaseFakeSuccess())
        XCTAssertNotNil(vm)
        
        vm.series.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 6)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
                XCTAssertEqual(data.count, 2)
                XCTAssertNil(data[1].description)
            }
            .store(in: &suscriptor)
        
        self.waitForExpectations(timeout: 10)
    }

}
