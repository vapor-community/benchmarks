import HTTP

let hostname = "0.0.0.0"
let port: Int = 9000

let res = HTTPResponse(body: "pong" as StaticString)

struct EchoResponder: HTTPServerResponder {
    func respond(to req: HTTPRequest, on worker: Worker) -> Future<HTTPResponse> {
        return worker.eventLoop.newSucceededFuture(result: res)
    }
}

print("Server starting on http://\(hostname):\(port)")
let group = MultiThreadedEventLoopGroup(numThreads: System.coreCount)
defer { try! group.syncShutdownGracefully() }

let server = try HTTPServer.start(hostname: hostname, port: port, responder: EchoResponder(), on: group).wait()
try server.onClose.wait()