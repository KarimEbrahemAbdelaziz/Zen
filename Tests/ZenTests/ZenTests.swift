import XCTest
@testable import Zen

final class ZenTests: XCTestCase {
    
    func testGetRequest() {
        let expectation = self.expectation(description: "Get Request")
        
        try? APIClient.$fetchTodo
            .set(method: .get)
            .set(path: "1")
            .build()
        
        APIClient.fetchTodo { result in
            switch result {
            case .success(let todo):
                print(todo.title)
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    static var allTests = [
        ("testGetRequest", testGetRequest)
    ]
}
