import Quick
import Nimble
@testable import UIButtonDecouple

class AuthenticatorSpy: Authenticator {
    var logon_wasCalled = false
    func logon() {
        logon_wasCalled = true
    }
}

class LogonViewControllerSpec: QuickSpec {
    override func spec() {
        describe("the logon screen") {
            var authenticatorSpy: AuthenticatorSpy!
            var logonVC: LogonViewController!

            beforeEach {
                authenticatorSpy = AuthenticatorSpy()
                logonVC = LogonViewController(
                    authenticator: authenticatorSpy
                )
            }

            it("displays a logon button") {
                expect(logonVC.logonButton.titleLabel?.text).to(equal("Logon"))
            }

            it("invokes the authentication service when tapping the button") {
                logonVC.logonButton.tap()


                expect(authenticatorSpy.logon_wasCalled).to(beTrue())
            }
        }
    }
}

extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}
