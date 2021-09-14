//
//  List.swift
//  Hibari
//
//  Created by netaka on 2021/09/08.
//  Copyright © 2021 netaka.net. All rights reserved.
//

import Foundation

public struct List: Identifiable, Codable {
    let createdAt: Date
    let slug: String
    let name: String
    let fullName: String
    let description: String
    let mode: String
    let following: Bool
    let memberCount: Int32
    let idStr: String
    let subscriberCount: Int32
    let id: Int64
    let url: String?
    
    init() {
        createdAt = Date()
        slug = ""
        name = ""
        fullName = ""
        description = ""
        mode = ""
        following = false
        memberCount = 0
        idStr = ""
        subscriberCount = 0
        id = 0
        url = nil
    }
}
