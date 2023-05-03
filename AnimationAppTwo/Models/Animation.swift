//
//  Animation.swift
//  AnimationApp
//
//  Created by Vovo on 03.05.2023.
//


struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double

    static func getAnimation() -> Animation {

        let preset = DataStore.shared.presets.randomElement() ?? ""
        let curve = DataStore.shared.curves.randomElement() ?? ""
        let force = Double.random(in: 0..<3)
        let duration = Double.random(in: 0.5..<2)
        let delay = Double.random(in: 0.5..<2)
 
        return Animation(preset: preset, curve: curve, force: force, duration: duration, delay: delay)
    }
}
