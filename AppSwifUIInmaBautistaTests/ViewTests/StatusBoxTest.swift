////
////  StatusBoxTest.swift
////  AppSwifUIInmaBautistaTests
////
////  Created by ibautista on 19/11/23.
////
//
//import XCTest
//@testable import AppSwifUIInmaBautista
//
//final class PrincipalSeriesViewTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testViewWhenNone() {
//
//        let vm = SeriesViewModel(characterId: 12, seriesCaseUse: SeriesUseCaseFakeSuccess())
//        XCTAssertNotNil(vm)
//
//        let view = PrincipalSeriesView(seriesViewModel: vm)
//        let statusView: StatusSeries
//
//
//        // Verificar que la vista adecuada está presente cuando el estado es .none
//        XCTAssertNotNil(view)
//        XCTAssertTrue(view.description.contains("LaunchView"))
//    }
//
//    func testViewWhenLoading() {
//        let view = PrincipalSeriesView(statusView: .loading)
//
//        // Verificar que la vista adecuada está presente cuando el estado es .loading
//        XCTAssertNotNil(view)
//        XCTAssertTrue(view.description.contains("LoaderView"))
//    }
//
//    func testViewWhenError() {
//        let error = "An error occurred"
//        let view = PrincipalSeriesView(statusView: .error(error: error))
//
//        // Verificar que la vista adecuada está presente cuando el estado es .error
//        XCTAssertNotNil(view)
//        XCTAssertTrue(view.description.contains("ErrorView"))
//        XCTAssertTrue(view.description.contains(error))
//    }
//
//    func testViewWhenLoaded() {
//        let series = [Serie(id: 1, name: "Serie 1"), Serie(id: 2, name: "Serie 2")]
//        let view = PrincipalSeriesView(statusView: .loaded(series: series))
//
//        // Verificar que la vista adecuada está presente cuando el estado es .loaded
//        XCTAssertNotNil(view)
//        XCTAssertTrue(view.description.contains("SeriesView"))
//        // Puedes agregar más verificaciones específicas para el estado .loaded según sea necesario
//    }
//}
