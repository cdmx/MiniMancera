import SpriteKit

class MOptionReformaCrossingSounds
{
    let soundCoin:SKAudioNode
    let soundFail:SKAudioNode
    let soundHonk:SKAudioNode
    let soundVictory:SKAudioNode
    let sound1up:SKAudioNode
    private let kSoundCoin:String = "soundCoin.caf"
    private let kSoundFail:String = "soundFail.caf"
    private let kSoundHonk:String = "soundCarHorn.caf"
    private let kSoundVictory:String = "soundVictory.caf"
    private let kSound1up:String = "sound1up"
    
    init()
    {
        soundCoin = SKAudioNode(fileNamed:kSoundCoin)
        soundCoin.autoplayLooped = false
        
        soundFail = SKAudioNode(fileNamed:kSoundFail)
        soundFail.autoplayLooped = false
        
        soundHonk = SKAudioNode(fileNamed:kSoundHonk)
        soundHonk.autoplayLooped = false
        
        soundVictory = SKAudioNode(fileNamed:kSoundVictory)
        soundVictory.autoplayLooped = false
        
        sound1up = SKAudioNode(fileNamed:kSound1up)
        sound1up.autoplayLooped = false
    }
}
