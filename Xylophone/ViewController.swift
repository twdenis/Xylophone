
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(button: sender.currentTitle!)
        UIView.animate(withDuration: 0.3) {
                sender.alpha = 0.5
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
              //Bring's sender's opacity back up to fully opaque.
            UIView.animate(withDuration: 0.3) {
                    sender.alpha = 1.0
                }
          }
        
    }
    
    func playSound(button: String) {
        let url = Bundle.main.url(forResource: button, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
