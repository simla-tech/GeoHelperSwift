//
//  LocaleConfiguration.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

/// Настройки локализации ответного сообщения
public struct LocaleConfiguration {

    /// ISO код языка на котором будет сформирован ответ (ISO 639-1)
    public let lang: String

    /// ISO код резервного языка на котором будет сформирован ответ (ISO 639-1)
    ///
    /// Используется когда отсутствует название объекта на основном языке
    public let fallbackLang: String?

    /// Инициалищация настроек локализации ответного сообщения
    /// - Parameters:
    ///   - lang: ISO код языка на котором будет сформирован ответ (ISO 639-1)
    ///   - fallbackLang: ISO код резервного языка на котором будет сформирован ответ (ISO 639-1) (используется когда отсутствует название объекта на основном языке)
    public init(lang: String, fallbackLang: String? = nil) {
        self.lang = lang
        self.fallbackLang = fallbackLang
    }

    /// Автоматически определить ISO коды языков на основе настроек `Locale.preferredLanguages`
    ///
    /// * `Locale.preferredLanguages[0]` будет использоваться в качестве основного языка (`lang`).
    /// * `Locale.preferredLanguages[1]` будет использоваться в качестве fallback языка (`fallbackLang`).
    ///
    /// Если `Locale.preferredLanguages` не будет содержать доступных языков, то объект не инициализациуется
    public init?() {
        guard let lang = Locale.preferredLanguages.first?.split(separator: "-").first?.lowercased() else { return nil }
        self.lang = lang
        if Locale.preferredLanguages.count > 1 {
            self.fallbackLang = Locale.preferredLanguages[1].split(separator: "-").first?.lowercased()
        } else {
            self.fallbackLang = nil
        }
    }

}
