//
//  CakeTests.swift
//  Cake ListTests
//
//  Created by Stu on 04/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import XCTest

class CakeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateCake(){
        
        let cake = Cake(title: "Chocolate cake", desc: "A cake made with three types of chocolate.", image: "https://www.googleimages.com/chocolatecake.jpeg")
        
        XCTAssertEqual(cake.title, "Chocolate cake")
        XCTAssertEqual(cake.desc, "A cake made with three types of chocolate.")
        XCTAssertEqual(cake.image, "https://www.googleimages.com/chocolatecake.jpeg")
        
    }

}
