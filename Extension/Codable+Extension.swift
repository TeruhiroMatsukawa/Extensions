//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation

/// Codableで値がdecodeできないことを許容する
public struct Safe<Wrapped: Decodable>: Codable
{
    public let value: Wrapped?

    public init(from decoder: Decoder) throws
    {
        do
        {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Wrapped.self)
        }
        catch
        {
            self.value = nil
        }
    }

    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

/**
    usage

    let json = """
    [
        {"name": "Taro"},
        {"name": 123}
    ]
    """.data(using: .utf8)!

    struct User: Decodable {
        let name: String
    }

    let users = try! JSONDecoder().decode([Safe<User>].self,
                                          from: json)
    users[0].value?.name //=> "Taro"
    users[1].value //=> nil

    let json2 = """
    {"url": "https://foo.com", "url2": "invalid url string"}
    """.data(using: .utf8)!

    struct Model: Decodable {
        let url: Safe<URL>
        let url2: Safe<URL>
    }

    let model = try! JSONDecoder().decode(Model.self,
                                          from: json)
    model.url.value?.absoluteString //=> "https://foo.com"
    model.url2.value //=> nil
*/

/// CodableでStringを任意の型に変換して受け取る
public struct StringTo<T: LosslessStringConvertible>: Codable
{
    public let value: T

    public init(from decoder: Decoder) throws
    {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)

        guard let value = T(stringValue) else
        {
            throw DecodingError.dataCorrupted(
                    .init(codingPath: decoder.codingPath,
                            debugDescription: "The string cannot cast to \(T.self).")
            )
        }

        self.value = value
    }

    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        try container.encode(value.description)
    }
}

/**
    usage

    let json = """
    {
        "number": "100",
    }
    """.data(using: .utf8)!

    struct Model: Codable {
        let number: StringTo<Int>
    }
    let model = try! JSONDecoder().decode(Model.self, from: data)
    model.number.value //=> 100 (Int型)
*/