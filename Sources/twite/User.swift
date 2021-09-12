//
//  User.swift
//  Hibari
//
//  Created by netaka on 2020/02/24.
//  Copyright © 2020 netaka.net. All rights reserved.
//

import Foundation

struct User: Equatable, Codable, Hashable {
    let id: Int
    let idStr: String
    let screenName: String
    let name: String
    let location: String
    let url: String?
    let description: String
    let protected: Bool
    let verified: Bool
    let followersCount: Int
    let friendsCount: Int
    let listedCount: Int
    let favouritesCount: Int
    let statusesCount: Int
    let profileBannerUrl: String?
    let profileImageUrlHttps: String
    let defaultProfile: Bool
    let defaultProfileImage: Bool
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
    
    init() {
        id = 0
        idStr = ""
        screenName = ""
        name = ""
        location = ""
        url = nil
        description = ""
        protected = false
        verified = false
        followersCount = 0
        friendsCount = 0
        listedCount = 0
        favouritesCount = 0
        statusesCount = 0
        profileBannerUrl = nil
        profileImageUrlHttps = ""
        defaultProfile = true
        defaultProfileImage = true
    }
}

struct Users: Codable {
    let users: [User]
}
