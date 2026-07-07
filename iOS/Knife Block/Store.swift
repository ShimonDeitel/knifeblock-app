import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    @Published private(set) var items: [Knife] = []
    @Published var isPro: Bool = false

    static let freeLimit = 20

    private let fileURL: URL

    init() {
        let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        fileURL = dir.appendingPathComponent("knifeblock_items.json")
        load()
    }

    var canAddMore: Bool {
        isPro || items.count < Store.freeLimit
    }

    func add(_ item: Knife) {
        items.append(item)
        save()
    }

    func update(_ item: Knife) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx] = item
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func delete(_ item: Knife) {
        items.removeAll { $0.id == item.id }
        save()
    }

    private func load() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([Knife].self, from: data) {
            items = decoded
        } else {
            items = [
        Knife(name: "Trapper", maker: "Case", steel: "Carbon Steel", notes: "Stag handle"),
        Knife(name: "Chef's Knife", maker: "Wusthof", steel: "German Steel", notes: "8 inch"),
        Knife(name: "Buck 110", maker: "Buck", steel: "440C", notes: "Brass bolsters"),
        Knife(name: "Santoku", maker: "Shun", steel: "VG-10", notes: "Damascus finish"),
        Knife(name: "Swiss Army Classic", maker: "Victorinox", steel: "Stainless", notes: "Red scales")
            ]
            save()
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: fileURL, options: .atomic)
        }
    }
}
