//
//  MockEnums.swift
//  APODApplication
//


import Foundation
enum RepositoryMockResult {
    case successWithValue
    case failureWithError
}
enum RemoteDatasourceMockResult {
    case successWithValue
    case failureWithError
}
enum APODAPIMockResult {
    case successWithValue
    case failureWithError
}
enum APODApplicationError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
}
enum ServerAPIMockResult {
    case apiSuccess
    case apiError
    case apiErrorNil
    case apiSuccessWithEmptyArray
    case apiSuccessWithUniqueValue
    case apiSuccessWithSameValue
    case invalidData
}
