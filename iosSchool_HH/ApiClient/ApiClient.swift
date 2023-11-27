//
//  ApiClient.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 13.11.2023.
//

import Foundation

class ApiClient {

    func performRequest<ResponseModel: Decodable> (
        url: String,
        data: Data?, // ["username": username, "password": password]
        method: NetworkConstants.HTTPMethod,
        onRequestCompleted: @escaping (Result<ResponseModel, ApiError>) -> Void
    ) {
        guard let url = URL(string: url) else {
            onRequestCompleted(.failure(.dataParsing))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if method != .get, let data, !data.isEmpty {
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                onRequestCompleted(.failure(.serverError))
            } else if let data,
                let decodedValue: ResponseModel = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                    onRequestCompleted(.success(decodedValue))
            } else {
                onRequestCompleted(.failure(.common(data)))
            }
        }
        task.resume()
    }
}
