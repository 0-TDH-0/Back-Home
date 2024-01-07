//
//  loginRequest.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation

struct LoginRequest: Encodable{
    let username: String
    let passkey: String
}
