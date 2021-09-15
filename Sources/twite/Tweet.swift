//
//  Tweet.swift
//  Hibari
//
//  Created by netaka on 2020/02/24.
//  Copyright © 2020 netaka.net. All rights reserved.
//

import Foundation

public struct Size: Codable {
    public let w: Int
    public let h: Int
    public let resize: String
}

public struct Sizes: Codable {
    public let large: Size
    public let medium: Size
    public let small: Size
    public let thumb: Size
}

public struct Media: Identifiable, Codable {
    public let id: Int64
    public let idStr: String
    public let mediaUrl: String
    public let mediaUrlHttps: String
    public let sizes: Sizes
    public let type: String
    public let url: String
}

public struct Url: Hashable, Codable {
    public let url: String
    public let expandedUrl: String
    public let displayUrl: String
}

public struct Entities: Codable {
    public let urls: [Url]?
}

public struct ExtendedEntities: Codable {
    public let media: [Media]?
}

public struct RetweetedStatus: Codable {
    public let id: Int64
    public let idStr: String
    public let text: String?
    public let fullText: String?
    public let user: User
    public let entities: Entities?
    public let extendedEntities: ExtendedEntities?
    public let createdAt: Date
    public let quoteCount: Int?
    public let replyCount: Int?
    public let retweetCount: Int?
    public let favoriteCount: Int?
    public let favorited: Bool
    public let retweeted: Bool
    public let possiblySensitive: Bool?
}

public struct QuotedStatus: Codable {
    public let id: Int64
    public let idStr: String
    public let text: String?
    public let fullText: String?
    public let user: User
    public let entities: Entities?
    public let extendedEntities: ExtendedEntities?
    public let createdAt: Date
    public let quoteCount: Int?
    public let replyCount: Int?
    public let retweetCount: Int?
    public let favoriteCount: Int?
    public let favorited: Bool
    public let retweeted: Bool
    public let possiblySensitive: Bool?
}

public struct QuotedStatusPermalink: Codable {
    public let url: String
}

public struct Tweet: Identifiable, Codable {
    public let createdAt: Date
    public let id: Int64
    public let idStr: String
    public let text: String?
    public let fullText: String?
    public let source: String
    public let user: User
    public let entities: Entities?
    public let extendedEntities: ExtendedEntities?
    public let retweetedStatus: RetweetedStatus?
    public let quotedStatusPermalink: QuotedStatusPermalink?
    public let quotedStatus: QuotedStatus?
    public let quoteCount: Int?
    public let replyCount: Int?
    public let retweetCount: Int?
    public let favoriteCount: Int?
    public let favorited: Bool
    public let retweeted: Bool
    public let possiblySensitive: Bool?
    
    public init() {
        self.createdAt = Date()
        self.id = 0
        self.idStr = ""
        self.text = ""
        self.fullText = ""
        self.source = ""
        self.user = User()
        self.entities = nil
        self.extendedEntities = nil
        self.retweetedStatus = nil
        self.quotedStatusPermalink = nil
        self.quotedStatus = nil
        self.quoteCount = nil
        self.replyCount = nil
        self.retweetCount = nil
        self.favoriteCount = nil
        self.favorited = false
        self.retweeted = false
        self.possiblySensitive = nil
    }
    
    public init(id: Int64, idStr: String, text: String, fullText: String) {
        self.createdAt = Date()
        self.id = id
        self.idStr = idStr
        self.text = text
        self.fullText = fullText
        self.source = ""
        self.user = User()
        self.entities = nil
        self.extendedEntities = nil
        self.retweetedStatus = nil
        self.quotedStatusPermalink = nil
        self.quotedStatus = nil
        self.quoteCount = nil
        self.replyCount = nil
        self.retweetCount = nil
        self.favoriteCount = nil
        self.favorited = false
        self.retweeted = false
        self.possiblySensitive = nil
    }
    
    public init(retweet: RetweetedStatus) {
        self.createdAt = retweet.createdAt
        self.id = retweet.id
        self.idStr = retweet.idStr
        self.text = retweet.text
        self.fullText = retweet.fullText
        self.source = ""
        self.user = retweet.user
        self.entities = retweet.entities
        self.extendedEntities = retweet.extendedEntities
        self.retweetedStatus = nil
        self.quotedStatusPermalink = nil
        self.quotedStatus = nil
        self.quoteCount = retweet.quoteCount
        self.replyCount = retweet.replyCount
        self.retweetCount = retweet.retweetCount
        self.favoriteCount = retweet.favoriteCount
        self.favorited = retweet.favorited
        self.retweeted = retweet.retweeted
        self.possiblySensitive = retweet.possiblySensitive
    }
    
    public init(quote: QuotedStatus) {
        self.createdAt = quote.createdAt
        self.id = quote.id
        self.idStr = quote.idStr
        self.text = quote.text
        self.fullText = quote.fullText
        self.source = ""
        self.user = quote.user
        self.entities = quote.entities
        self.extendedEntities = quote.extendedEntities
        self.retweetedStatus = nil
        self.quotedStatusPermalink = nil
        self.quotedStatus = nil
        self.quoteCount = quote.quoteCount
        self.replyCount = quote.replyCount
        self.retweetCount = quote.retweetCount
        self.favoriteCount = quote.favoriteCount
        self.favorited = quote.favorited
        self.retweeted = quote.retweeted
        self.possiblySensitive = quote.possiblySensitive
    }
    
    public static func Sample() -> Self {
        let tweet = Tweet(id: 1, idStr: "1", text: "sample text", fullText: "this is sample text")
        return tweet
    }
    
    public func HasMedia() -> Bool {
        var hasMedia = false
        if let extendedEntities = self.extendedEntities {
            if extendedEntities.media != nil {
                hasMedia = true
            }
        }
        return hasMedia
    }
}
