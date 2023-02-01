//
//  GeoHelperDictionary.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Вспомогательная обертка для словарей
///
/// Необходима для ручного декодирования, так как при пустом ответе сервера возвращается [], что декодер воспринимает как массив
public struct GeoHelperDictionary<Key: Hashable, Value> {

    public typealias DictionaryType = [Key: Value]

    private var data = DictionaryType()

    internal init(data: DictionaryType) {
        self.data = data
    }

    public subscript(key: Key) -> Value? {
        get { self.data[key] }
        set { self.data[key] = newValue }
    }

}

extension GeoHelperDictionary: Collection {

    public typealias Index = DictionaryType.Index
    public typealias Element = DictionaryType.Element

    public var startIndex: Index { self.data.startIndex }
    public var endIndex: Index { self.data.endIndex }

    public subscript(index: Index) -> Iterator.Element { self.data[index] }

    public func index(after i: GeoHelperDictionary.DictionaryType.Index) -> GeoHelperDictionary.DictionaryType.Index {
        self.data.index(after: i)
    }

}

extension GeoHelperDictionary: Decodable where Key: Decodable, Value: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode(DictionaryType.self) {
            self.data = data
        } else {
            self.data = [:]
        }
    }

}
