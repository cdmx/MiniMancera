import UIKit

protocol MOptionReformaCrossingGameOverProtocol
{
    var title:String { get }
    var descr:String { get }
    var keepAdvancing:Bool { get }
    
    func texture(textures:MOptionReformaCrossingTextures) -> MGameTexture
}
