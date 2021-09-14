//
//  Tweet.swift
//  Hibari
//
//  Created by netaka on 2020/02/24.
//  Copyright © 2020 netaka.net. All rights reserved.
//

import Foundation

public struct Size: Codable {
    let w: Int
    let h: Int
    let resize: String
}

public struct Sizes: Codable {
    let large: Size
    let medium: Size
    let small: Size
    let thumb: Size
}

public struct Media: Identifiable, Codable {
    let id: Int64
    let idStr: String
    let mediaUrl: String
    let mediaUrlHttps: String
    let sizes: Sizes
    let type: String
    let url: String
}

public struct Url: Hashable, Codable {
    let url: String
    let expandedUrl: String
    let displayUrl: String
}

public struct Entities: Codable {
    let urls: [Url]?
}

public struct ExtendedEntities: Codable {
    let media: [Media]?
}

public struct RetweetedStatus: Codable {
    let id: Int64
    let idStr: String
    let text: String?
    let fullText: String?
    let user: User
    let entities: Entities?
    let extendedEntities: ExtendedEntities?
    let createdAt: Date
    let quoteCount: Int?
    let replyCount: Int?
    let retweetCount: Int?
    let favoriteCount: Int?
    let favorited: Bool
    let retweeted: Bool
    let possiblySensitive: Bool?
}

public struct QuotedStatus: Codable {
    let id: Int64
    let idStr: String
    let text: String?
    let fullText: String?
    let user: User
    let entities: Entities?
    let extendedEntities: ExtendedEntities?
    let createdAt: Date
    let quoteCount: Int?
    let replyCount: Int?
    let retweetCount: Int?
    let favoriteCount: Int?
    let favorited: Bool
    let retweeted: Bool
    let possiblySensitive: Bool?
}

public struct QuotedStatusPermalink: Codable {
    let url: String
}

public struct Tweet: Identifiable, Codable {
    let createdAt: Date
    let id: Int64
    let idStr: String
    let text: String?
    let fullText: String?
    let source: String
    let user: User
    let entities: Entities?
    let extendedEntities: ExtendedEntities?
    let retweetedStatus: RetweetedStatus?
    let quotedStatusPermalink: QuotedStatusPermalink?
    let quotedStatus: QuotedStatus?
    let quoteCount: Int?
    let replyCount: Int?
    let retweetCount: Int?
    let favoriteCount: Int?
    let favorited: Bool
    let retweeted: Bool
    let possiblySensitive: Bool?
    
    init() {
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
    
    init(id: Int64, idStr: String, text: String, fullText: String) {
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
    
    init(retweet: RetweetedStatus) {
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
    
    init(quote: QuotedStatus) {
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
    
    static func Sample() -> Self {
        let tweet = Tweet(id: 1, idStr: "1", text: "sample text", fullText: "this is sample text")
        return tweet
    }
    
    func HasMedia() -> Bool {
        var hasMedia = false
        if let extendedEntities = self.extendedEntities {
            if extendedEntities.media != nil {
                hasMedia = true
            }
        }
        return hasMedia
    }
}
