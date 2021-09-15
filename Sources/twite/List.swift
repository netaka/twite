//
//  List.swift
//  Hibari
//
//  Created by netaka on 2021/09/08.
//  Copyright © 2021 netaka.net. All rights reserved.
//

import Foundation

public struct List: Identifiable, Codable {
    public let createdAt: Date
    public let slug: String
    public let name: String
    public let fullName: String
    public let description: String
    public let mode: String
    public let following: Bool
    public let memberCount: Int32
    public let idStr: String
    public let subscriberCount: Int32
    public let id: Int64
    public let url: String?
    
    public init() {
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
