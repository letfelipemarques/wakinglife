import SwiftUI
import WebKit

// MARK: - Gif support via WebKit
struct Gif: UIViewRepresentable {

    private let imageName: String

    init(_ name: String) {
        self.imageName = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        guard let url = Bundle.main.url(forResource: imageName,
                                        withExtension: "gif")
        else { return WKWebView() }
        guard let data = try? Data(contentsOf: url) else { return WKWebView() }
        webView.load(data,
                     mimeType: "image/gif",
                     characterEncodingName: "UTF-8",
                     baseURL: url.deletingLastPathComponent())
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct Gif_Previews: PreviewProvider {
    static var previews: some View {
        Gif("")
    }
}
