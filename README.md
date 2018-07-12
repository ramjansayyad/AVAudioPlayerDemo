# AVAudioPlayer
Play, Pause, Stop mp3 music file from app bundle 

Step 1 :
Fetch music file from bundle :
        let url = Bundle.main.url(forResource: "ok Jaanu", withExtension: "mp3")!

Step 2: 
Initialise AVAudioPlayer object with the path of music file. prepareToPlay() will setup basic configuration for AVAudioPlayer. You can also set up few ui controls to default configuration.

do {
            player = try AVAudioPlayer(contentsOf: url)
            
         //   let songDuration = player.duration //in seconds
         //   StartTimeTxt.text = "0.00"
         //   EndTimeTxt.text = "\(String(format: "%.2f", songDuration))"
            
         //   SongProgressSlider.minimumValue = 0.0
         //   SongProgressSlider.maximumValue = Float(songDuration)
         //   SongProgressSlider.setValue(0.0, animated: true)
            
            guard let player = player else { return }
            player.prepareToPlay() 
            
        } catch let error as NSError {
            print(error.description)
        }

Step 3:
Bellow line of code will trigger the music file to play
        player.play()

Step 4: 
Stop music using -             player.stop()
Pause music using -           player.pause()

Step 5: To update progress bar & song played & remaining timing use below method. Invoke this method by using timer.

func updateTime(_ sender: Any) { 

        let songCurrTime = player.currentTime
        print(songCurrTime)
      //  StartTimeTxt.text = "\(String(format: "%.2f", songCurrTime))"
      //  SongProgressSlider.setValue(Float(songCurrTime), animated: true)
        
      //  if(songCurrTime >= player.duration)
      //  {
      //       player.stop()
      //      timer.invalidate()
      //  }
    }
