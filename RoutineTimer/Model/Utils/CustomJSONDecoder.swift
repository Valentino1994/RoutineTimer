//
//  CustomJSONDecoder.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/24.
//

import Foundation

struct CustomJSONDecoder {
    
    static func decode<T: Codable>(from fileName: String, type: T.Type) -> T? {
        do {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                return nil
            }
            let result = try JSONDecoder().decode(T.self, from: data)
            
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
}
