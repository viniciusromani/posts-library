import Foundation
import Swinject

extension Container {
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let unwrapped = self.resolve(serviceType) else {
            fatalError("Could not resolve \(String(describing: serviceType)) service on DI")
        }
        return unwrapped
    }
}
