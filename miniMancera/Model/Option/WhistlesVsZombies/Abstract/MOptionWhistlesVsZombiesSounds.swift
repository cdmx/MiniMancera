import SpriteKit

class MOptionWhistlesVsZombiesSounds
{
    let soundFail:SKAction
    let soundWhistle:SKAction
    let soundVictory:SKAction
    let sound1up:SKAction
    private let kSoundFail:String = "soundFail.caf"
    private let kSoundWhistle:String = "soundWhistle.caf"
    private let kSoundVictory:String = "soundVictory.caf"
    private let kSound1up:String = "sound1up"
    
    init()
    {
        soundFail = SKAction.playSoundFileNamed(kSoundFail, waitForCompletion:false)
        soundWhistle = SKAction.playSoundFileNamed(kSoundWhistle, waitForCompletion:false)
        soundVictory = SKAction.playSoundFileNamed(kSoundVictory, waitForCompletion:false)
        sound1up = SKAction.playSoundFileNamed(kSound1up, waitForCompletion:false)
    }
}
