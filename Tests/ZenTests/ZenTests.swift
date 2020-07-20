import XCTest
@testable import Zen

final class ZenTests: XCTestCase {
    
    func testGetRequestWithCustomPath() {
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
    
    func testGetRequestWithQueryParameters() {
        let expectation = self.expectation(description: "Get Request with Query Parameters")
        
        try? APIClient.$fetchUsers
            .set(method: .get)
            .set(parameters: .url([
                "delay": "3"
            ]))
            .build()
        
        APIClient.fetchUsers { result in
            switch result {
            case .success(let users):
                print(users.data.count)
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPostRequest() {
        let expectation = self.expectation(description: "Post Request with Body Parameters")
        
        try? APIClient.$createUser
            .set(method: .post)
            .set(parameters: .body([
                "name": "Karim Ebrahem",
                "job": "iOS Software Engineer"
            ]))
            .build()
        
        APIClient.createUser { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    static var allTests = [
        ("testGetRequestWithCustomPath", testGetRequestWithCustomPath),
        ("testGetRequestWithQueryParameters", testGetRequestWithQueryParameters),
        ("testPostRequest", testPostRequest)
    ]
}
