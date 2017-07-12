import SpriteKit

class MOptionReformaCrossingSounds
{
    let soundCoin:SKAction
    let soundFail:SKAction
    let soundHonk:SKAction
    let soundVictory:SKAction
    let sound1up:SKAction
    private let kSoundCoin:String = "soundCoin.caf"
    private let kSoundFail:String = "soundFail.caf"
    private let kSoundHonk:String = "soundCarHorn.caf"
    private let kSoundVictory:String = "soundVictory.caf"
    private let kSound1up:String = "sound1up.caf"
    
    init()
    {
        soundCoin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion:false)
        soundFail = SKAction.playSoundFileNamed(kSoundFail, waitForCompletion:false)
        soundHonk = SKAction.playSoundFileNamed(kSoundHonk, waitForCompletion:false)
        soundVictory = SKAction.playSoundFileNamed(kSoundVictory, waitForCompletion:false)
        sound1up = SKAction.playSoundFileNamed(kSound1up, waitForCompletion:false)
    }
}
