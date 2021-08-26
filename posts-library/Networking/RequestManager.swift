import Foundation
import RxSwift
import Alamofire

final class RequestManager<T: Decodable> {
    func request(_ spec: Request) -> Single<T> {
        return Single<T>.create { single in
            let request = Session.default.request(
                type(of: self).url(path: spec.path),
                method: self.convertToAlamoHTTPMethod(spec.method),
                parameters: spec.parameters,
                encoding: self.getAlamoDefaultEncoder(spec.method),
                headers: self.convertToAlamoHTTPHeaders(spec.headers)
            )
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case let .success(decoded):
                    single(.success(decoded))
                case let .failure(error):
                    single(.failure(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}

// MARK: - Helpers
extension RequestManager {
    private static func url(path: String) -> URLConvertible {
        return "https://iddog-nrizncxqba-uc.a.run.app/\(path)"
    }
    
    private func convertToAlamoHTTPMethod(_ method: HTTPMethod) -> Alamofire.HTTPMethod {
        return Alamofire.HTTPMethod(rawValue: method.rawValue)
    }
    
    private func convertToAlamoHTTPHeaders(_ headers: [String: String]?) -> Alamofire.HTTPHeaders? {
        guard let unwrapped = headers else { return nil }
        return Alamofire.HTTPHeaders(unwrapped)
    }
    
    private func getAlamoDefaultEncoder(_ method: HTTPMethod) -> Alamofire.ParameterEncoding {
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return encoding
    }
}
