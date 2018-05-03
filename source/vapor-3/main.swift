import Vapor

var services = Services.default()

let middlewares = MiddlewareConfig()
services.register(middlewares)

let serverConfig = EngineServerConfig.default(hostname: "0.0.0.0", port: 9000)
services.register(serverConfig)

let router = EngineRouter.default()
router.get("ping") { req in
    return "pong" as StaticString
}
services.register(router, as: Router.self)

let app = try Application(config: .default(), environment: .detect(), services: services)
try app.run()
