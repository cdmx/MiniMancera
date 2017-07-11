import SpriteKit

class MOptionPollutedGardenSounds
{
    let soundCoin:SKAction
    let soundPop:SKAction
    let soundFail:SKAction
    let sound1up:SKAction
    private let kSoundCoin:String = "soundCoin.caf"
    private let kSoundFail:String = "soundFail.caf"
    private let kSoundPop:String = "soundPop.caf"
    private let kSound1up:String = "sound1up.caf"
    
    init()
    {
        soundCoin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion:false)
        soundPop = SKAction.playSoundFileNamed(kSoundPop, waitForCompletion:false)
        soundFail = SKAction.playSoundFileNamed(kSoundFail, waitForCompletion:false)
        sound1up = SKAction.playSoundFileNamed(kSound1up, waitForCompletion:false)
    }
}
