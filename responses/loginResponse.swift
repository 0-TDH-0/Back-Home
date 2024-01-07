//
//  loginResponse.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation

struct LoginResponse: Decodable {
    let responseData: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
