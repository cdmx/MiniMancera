import UIKit

protocol MOptionReformaCrossingGameOverProtocol
{
    var title:String { get }
    var descr:String { get }
    
    func texture(textures:MOptionReformaCrossingTextures) -> MGameTexture
}
