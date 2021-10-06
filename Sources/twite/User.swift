//
//  User.swift
//  Hibari
//
//  Created by netaka on 2020/02/24.
//  Copyright © 2020 netaka.net. All rights reserved.
//

import Foundation

public class User: ObservableObject, Equatable, Codable, Hashable {
    public let id: Int
    public let idStr: String
    public let screenName: String
    public let name: String
    public let location: String
    public let url: String?
    public let description: String
    public let protected: Bool
    public let verified: Bool
    public let followersCount: Int
    public let friendsCount: Int
    public let listedCount: Int
    public let favouritesCount: Int
    public let statusesCount: Int
    public let profileBannerUrl: String?
    public let profileImageUrlHttps: String
    public let defaultProfile: Bool
    public let defaultProfileImage: Bool
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
    
    public init() {
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

public struct Users: Codable {
    public let users: [User]
}
