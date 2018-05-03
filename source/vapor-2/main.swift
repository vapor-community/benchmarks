import Vapor

/// Manually override config
let config = Config([:])
config.arguments = ["vapor", "serve", "--port=9000"]
config.environment = .production

let drop = try Droplet(config: config, middleware: [])

drop.get("ping") { req in
    return "pong"
}

try drop.run()
