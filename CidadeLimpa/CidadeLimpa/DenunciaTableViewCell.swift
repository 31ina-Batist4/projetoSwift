//
//  DenunciaTableViewCell.swift
//  CidadeLimpa
//
//  Created by user209392 on 1/7/22.
//

import UIKit

class DenunciaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewImagem: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelEndereco: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureWith(_ denuncia: Denuncia) {
        labelNome.text = denuncia.nome
        labelEndereco.text = denuncia.endereco
        labelDescricao.text = denuncia.descricao
        if let imagem = denuncia.imagem {
           imageViewImagem.image = UIImage(data: imagem)
        }
    }

}
