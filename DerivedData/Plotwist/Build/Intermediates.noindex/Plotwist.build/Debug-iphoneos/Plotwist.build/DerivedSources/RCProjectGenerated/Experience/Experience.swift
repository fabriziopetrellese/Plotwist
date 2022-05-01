//
// Experience.swift
// GENERATED CONTENT. DO NOT EDIT.
//

import Foundation
import RealityKit
import simd
import Combine

@available(iOS 13.0, macOS 10.15, *)
public enum Experience {

    public enum LoadRealityFileError: Error {
        case fileNotFound(String)
    }

    private static var streams = [Combine.AnyCancellable]()

    public static func loadVideogames() throws -> Experience.Videogames {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Videogames.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Videogames", isDirectory: false)
        let anchorEntity = try Experience.Videogames.loadAnchor(contentsOf: realityFileSceneURL)
        return createVideogames(from: anchorEntity)
    }

    public static func loadVideogamesAsync(completion: @escaping (Swift.Result<Experience.Videogames, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Videogames.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Videogames", isDirectory: false)
        let loadRequest = Experience.Videogames.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createVideogames(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createVideogames(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Videogames {
        let videogames = Experience.Videogames()
        videogames.anchoring = anchorEntity.anchoring
        videogames.addChild(anchorEntity)
        return videogames
    }

    public static func loadTravel() throws -> Experience.Travel {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Travel.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Travel", isDirectory: false)
        let anchorEntity = try Experience.Travel.loadAnchor(contentsOf: realityFileSceneURL)
        return createTravel(from: anchorEntity)
    }

    public static func loadTravelAsync(completion: @escaping (Swift.Result<Experience.Travel, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Travel.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Travel", isDirectory: false)
        let loadRequest = Experience.Travel.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createTravel(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createTravel(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Travel {
        let travel = Experience.Travel()
        travel.anchoring = anchorEntity.anchoring
        travel.addChild(anchorEntity)
        return travel
    }

    public static func loadAnimals() throws -> Experience.Animals {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Animals.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Animals", isDirectory: false)
        let anchorEntity = try Experience.Animals.loadAnchor(contentsOf: realityFileSceneURL)
        return createAnimals(from: anchorEntity)
    }

    public static func loadAnimalsAsync(completion: @escaping (Swift.Result<Experience.Animals, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Animals.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Animals", isDirectory: false)
        let loadRequest = Experience.Animals.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createAnimals(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createAnimals(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Animals {
        let animals = Experience.Animals()
        animals.anchoring = anchorEntity.anchoring
        animals.addChild(anchorEntity)
        return animals
    }

    public static func loadFood() throws -> Experience.Food {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Food.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Food", isDirectory: false)
        let anchorEntity = try Experience.Food.loadAnchor(contentsOf: realityFileSceneURL)
        return createFood(from: anchorEntity)
    }

    public static func loadFoodAsync(completion: @escaping (Swift.Result<Experience.Food, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Food.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Food", isDirectory: false)
        let loadRequest = Experience.Food.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createFood(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createFood(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Food {
        let food = Experience.Food()
        food.anchoring = anchorEntity.anchoring
        food.addChild(anchorEntity)
        return food
    }

    public static func loadEmotions() throws -> Experience.Emotions {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Emotions.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Emotions", isDirectory: false)
        let anchorEntity = try Experience.Emotions.loadAnchor(contentsOf: realityFileSceneURL)
        return createEmotions(from: anchorEntity)
    }

    public static func loadEmotionsAsync(completion: @escaping (Swift.Result<Experience.Emotions, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Emotions.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Emotions", isDirectory: false)
        let loadRequest = Experience.Emotions.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createEmotions(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createEmotions(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Emotions {
        let emotions = Experience.Emotions()
        emotions.anchoring = anchorEntity.anchoring
        emotions.addChild(anchorEntity)
        return emotions
    }

    public static func loadSports() throws -> Experience.Sports {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Sports.self).url(forResource: "Experience", withExtension: "reality") else {
            throw Experience.LoadRealityFileError.fileNotFound("Experience.reality")
        }

        let realityFileSceneURL = realityFileURL.appendingPathComponent("Sports", isDirectory: false)
        let anchorEntity = try Experience.Sports.loadAnchor(contentsOf: realityFileSceneURL)
        return createSports(from: anchorEntity)
    }

    public static func loadSportsAsync(completion: @escaping (Swift.Result<Experience.Sports, Swift.Error>) -> Void) {
        guard let realityFileURL = Foundation.Bundle(for: Experience.Sports.self).url(forResource: "Experience", withExtension: "reality") else {
            completion(.failure(Experience.LoadRealityFileError.fileNotFound("Experience.reality")))
            return
        }

        var cancellable: Combine.AnyCancellable?
        let realityFileSceneURL = realityFileURL.appendingPathComponent("Sports", isDirectory: false)
        let loadRequest = Experience.Sports.loadAnchorAsync(contentsOf: realityFileSceneURL)
        cancellable = loadRequest.sink(receiveCompletion: { loadCompletion in
            if case let .failure(error) = loadCompletion {
                completion(.failure(error))
            }
            streams.removeAll { $0 === cancellable }
        }, receiveValue: { entity in
            completion(.success(Experience.createSports(from: entity)))
        })
        cancellable?.store(in: &streams)
    }

    private static func createSports(from anchorEntity: RealityKit.AnchorEntity) -> Experience.Sports {
        let sports = Experience.Sports()
        sports.anchoring = anchorEntity.anchoring
        sports.addChild(anchorEntity)
        return sports
    }

    public class Videogames: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice1: RealityKit.Entity? {
            return self.findEntity(named: "Dice1")
        }



        public var dice2: RealityKit.Entity? {
            return self.findEntity(named: "Dice2")
        }



        public var dice3: RealityKit.Entity? {
            return self.findEntity(named: "Dice3")
        }



        public var dice4: RealityKit.Entity? {
            return self.findEntity(named: "Dice4")
        }



    }

    public class Travel: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice5: RealityKit.Entity? {
            return self.findEntity(named: "Dice5")
        }



        public var dice6: RealityKit.Entity? {
            return self.findEntity(named: "Dice6")
        }



        public var dice7: RealityKit.Entity? {
            return self.findEntity(named: "Dice7")
        }



        public var dice8: RealityKit.Entity? {
            return self.findEntity(named: "Dice8")
        }



    }

    public class Animals: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice10: RealityKit.Entity? {
            return self.findEntity(named: "Dice10")
        }



        public var dice11: RealityKit.Entity? {
            return self.findEntity(named: "Dice11")
        }



        public var dice12: RealityKit.Entity? {
            return self.findEntity(named: "Dice12")
        }



        public var dice9: RealityKit.Entity? {
            return self.findEntity(named: "Dice9")
        }



    }

    public class Food: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice13: RealityKit.Entity? {
            return self.findEntity(named: "Dice13")
        }



        public var dice14: RealityKit.Entity? {
            return self.findEntity(named: "Dice14")
        }



        public var dice15: RealityKit.Entity? {
            return self.findEntity(named: "Dice15")
        }



        public var dice16: RealityKit.Entity? {
            return self.findEntity(named: "Dice16")
        }



    }

    public class Emotions: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice17: RealityKit.Entity? {
            return self.findEntity(named: "Dice17")
        }



        public var dice18: RealityKit.Entity? {
            return self.findEntity(named: "Dice18")
        }



        public var dice19: RealityKit.Entity? {
            return self.findEntity(named: "Dice19")
        }



        public var dice20: RealityKit.Entity? {
            return self.findEntity(named: "Dice20")
        }



    }

    public class Sports: RealityKit.Entity, RealityKit.HasAnchoring {

        public var dice21: RealityKit.Entity? {
            return self.findEntity(named: "Dice21")
        }



        public var dice22: RealityKit.Entity? {
            return self.findEntity(named: "Dice22")
        }



        public var dice23: RealityKit.Entity? {
            return self.findEntity(named: "Dice23")
        }



        public var dice24: RealityKit.Entity? {
            return self.findEntity(named: "Dice24")
        }



    }

}
