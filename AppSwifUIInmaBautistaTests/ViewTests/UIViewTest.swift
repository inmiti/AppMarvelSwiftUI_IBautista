//
//  UIViewTest.swift
//  AppSwifUIInmaBautistaTests
//
//  Created by ibautista on 18/11/23.
//

import XCTest
import ViewInspector

@testable import AppSwifUIInmaBautista

final class UIViewTest: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testUI_ErrorView() throws {
        let view = ErrorView(error: "Prueba de Testing")
            .environmentObject(RootViewModel(characterCaseUse: CharactersUseCaseFakeSuccess()))
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        //Texto
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let textTest = try text.text().string()
        XCTAssertEqual(textTest,"Error: Prueba de Testing")
        
        //Button
        let button = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(button)
        
        // Tap button
        try button.button().tap()
        
    }
    
    func testUI_LoaderView() throws {
        let view = LoaderView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen
        let image = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(image)
        
        //Texto
        let text = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(text)
    }
    
    func testUI_CharacterRowViews() throws{
        let characterFake = CharacterFake().responseCharacters.data.results[0]
        let view = CharacterRowView(character: characterFake)
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen
        let image = try view.inspect().find(viewWithId: 5)
        XCTAssertNotNil(image)
        
        //Texto
        let text = try view.inspect().find(viewWithId: 6)
        XCTAssertNotNil(text)
        
        let textTest = try text.text().string()
        XCTAssertEqual(textTest,"3-D Man")
    }
    
    func testUI_SeriesRowViews() throws{
        let seriesFake = SeriesFake().responseSeries.data.results[0]
        let view = SeriesRowView(serie: seriesFake)
        
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        //Imagen
        let image = try view.inspect().find(viewWithId: 7)
        XCTAssertNotNil(image)
        
        //Texto
        let text = try view.inspect().find(viewWithId: 8)
        XCTAssertNotNil(text)
        
        let textTest = try text.text().string()
        XCTAssertEqual(textTest,seriesFake.description)
    }
}
