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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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


}
