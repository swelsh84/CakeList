//
//  NetworkClientTests.swift
//  Cake ListTests
//
//  Created by Stu on 04/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import XCTest

class NetworkClientTests: XCTestCase {
    
    let cakeURL = ""

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDownloadCakesEqual20(){
        
        let networkClient = NetworkClient()
        
        networkClient.download(downloadURL: cakeURL) { cakes in
            XCTAssertEqual(cakes.count, 20)
        }
    }
    
    func testFirstDownloadedCakeIsLemon(){
        let networkClient = NetworkClient()
        
        networkClient.download(downloadURL: cakeURL) { cakes in
            
            if let firstCake = cakes.first{
                XCTAssertEqual(firstCake.title, "Lemon cheesecake")
                XCTAssertEqual(firstCake.desc, "A cheesecake made of lemon")
                XCTAssertEqual(firstCake.image, "https://s3-eu-west-1.amazonaws.com/s3.mediafileserver.co.uk/carnation/WebFiles/RecipeImages/lemoncheesecake_lg.jpg")
            } else {
                XCTFail("There was no first cake found.")
            }
        }
    }

}
