//
//  TwitterApiMuteBlockAndReportUsers.swift
//  
//
//  Created by netaka on 2021/09/23.
//  
//

import Foundation
import OAuthSwift

extension TwitterApi {
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-ids
    public func getBlocksIds(success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "blocks/ids.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }

    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-list
    public func getBlocksList(success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "blocks/list.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids
    public func getMutesUsersIds(success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "mutes/users/ids.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list
    public func getMutesUsersList(success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "mutes/users/list.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-create
    public func postBlocksCreate(_ screenName: String) {
        oauth1.client.post(TWITTER_API + "blocks/create.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-destroy
    public func postBlocksDestroy(_ screenName: String) {
        oauth1.client.post(TWITTER_API + "blocks/destroy.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-create
    public func postMutesUsersCreate(_ screenName: String) {
        oauth1.client.post(TWITTER_API + "mutes/users/create.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-destroy
    public func postMutesUsersDestroy(_ screenName: String) {
        oauth1.client.post(TWITTER_API + "mutes/users/destroy.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam
    public func postUsersReportSpam(_ screenName: String) {
        oauth1.client.post(TWITTER_API + "users/report_spam.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
