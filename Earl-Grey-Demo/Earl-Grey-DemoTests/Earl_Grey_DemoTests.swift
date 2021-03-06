import XCTest
@testable import Earl_Grey_Demo

class Earl_Grey_DemoTests: XCTestCase, UITest {

  override func tearDown() {
    super.tearDown()
    onView(with: .accessibilityLabel("First"), .type(UILabel.self)).tap()
    onView(with: .accessibilityLabel("Input")).backspace(times: 5)
  }

  func testEnteringANameOnTheFirstThenTappingGoWelcomesYouOnTheSecond() {
    onView(with: .accessibilityLabel("Input")).type("Bert")
    onView(with: .title("Go")).tap()

    onView(with: .accessibilityLabel("welcome")).assertText(matches: "Welcome, Bert")
  }

  func testEnteringNoNameOnTheFirstThenTappingGoWelcomesAStrangerOnTheSecond() {
    onView(with: .title("Go")).tap()

    onView(with: .accessibilityLabel("welcome")).assertText(matches: "Welcome stranger!")
  }

}
