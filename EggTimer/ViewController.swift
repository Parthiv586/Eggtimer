import AVFoundation
import UIKit
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    let eggTime = ["Soft": 4, "Medium": 4, "Hard": 7]
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    var p = 0
    
    @objc func updateTimer()  {
        if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        } else if secondPassed == totalTime {
            //        } else
            //        if secondPassed == totalTime
            //        {
            //            playSound()
             titleLabel.text = "Done!"
            if p == 0 {
                playSound()
                p+=1
            }
        }else {
            
            timer.invalidate()
           
        }
    }
    func playSound()  {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player  = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        
    }
}
